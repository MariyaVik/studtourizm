import 'package:json_annotation/json_annotation.dart';

import 'place_details.dart';

part 'place.g.dart';

@JsonSerializable(explicitToJson: true)
class Place {
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final PlaceDetails details;
  // @JsonKey(fromJson: _fromJson, toJson: _toJson)
  // Map rooms;
  @JsonKey(defaultValue: 'id')
  final String id;
  @JsonKey(defaultValue: 'universityId')
  final String universityId;

  Place({
    required this.details,
    required this.id,
    required this.universityId,
    // required this.rooms,
  });

  const Place.none(
      {this.details = const PlaceDetails.none(),
      this.id = 'id',
      this.universityId = 'universityId'});

  static PlaceDetails _fromJson(Map<String, dynamic>? json) =>
      json == null ? const PlaceDetails.none() : PlaceDetails.fromJson(json);
  static String _toJson(PlaceDetails object) => object.toString();

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
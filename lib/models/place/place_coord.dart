import 'package:json_annotation/json_annotation.dart';

part 'place_coord.g.dart';

@JsonSerializable()
class PlaceCoord {
  @JsonKey(name: 'lat', defaultValue: 0, fromJson: _fromJson)
  final double latitude;
  @JsonKey(name: 'lng', defaultValue: 0, fromJson: _fromJson)
  final double longitude;

  PlaceCoord({required this.latitude, required this.longitude});
  const PlaceCoord.none({this.latitude = 0, this.longitude = 0});

  static double _fromJson(coord) =>
      coord is String ? double.parse(coord) : coord;

  factory PlaceCoord.fromJson(Map<String, dynamic> json) =>
      _$PlaceCoordFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceCoordToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'place_coord.dart';

part 'place_main.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceMain {
  @JsonKey(defaultValue: 'name')
  final String name;
  @JsonKey(defaultValue: 'city')
  final String city;
  @JsonKey(defaultValue: 'street')
  final String street;
  @JsonKey(defaultValue: 'houseNumber')
  final String houseNumber;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final PlaceCoord coordinates;
  @JsonKey(defaultValue: 'mealPlan')
  final String mealPlan;
  @JsonKey(defaultValue: 'minDays')
  final String minDays;
  @JsonKey(defaultValue: 'maxDays')
  final String maxDays;
  @JsonKey(defaultValue: [])
  final List photos;

  PlaceMain({
    required this.city,
    required this.coordinates,
    required this.houseNumber,
    required this.maxDays,
    required this.mealPlan,
    required this.minDays,
    required this.name,
    required this.photos,
    required this.street,
  });

  const PlaceMain.none({
    this.city = 'city',
    this.coordinates = const PlaceCoord.none(),
    this.houseNumber = 'houseNumber',
    this.maxDays = 'maxDays',
    this.mealPlan = 'mealPlan',
    this.minDays = 'minDays',
    this.name = 'name',
    this.photos = const [],
    this.street = 'street',
  });
  static PlaceCoord _fromJson(Map<String, dynamic>? json) =>
      json == null ? const PlaceCoord.none() : PlaceCoord.fromJson(json);
  static String _toJson(PlaceCoord object) => object.toString();

  factory PlaceMain.fromJson(Map<String, dynamic> json) =>
      _$PlaceMainFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceMainToJson(this);
}

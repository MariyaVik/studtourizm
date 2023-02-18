import 'package:json_annotation/json_annotation.dart';

import 'place_main.dart';
import 'place_rules.dart';

part 'place_details.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceDetails {
  @JsonKey(name: 'main-info', fromJson: _fromJsonMain, toJson: _toJsonMain)
  final PlaceMain mainInfo;
  @JsonKey(fromJson: _fromJsonRules, toJson: _toJsonRules)
  final PlaceRules rules;
  @JsonKey(defaultValue: [])
  final List documents;
  @JsonKey(defaultValue: 'district')
  final String district;
  // @JsonKey(defaultValue: [])
  // final List<PlaceService> services;
  PlaceDetails({
    required this.mainInfo,
    required this.rules,
    required this.documents,
    required this.district,
    // required this.services,
  });

  const PlaceDetails.none({
    this.documents = const [],
    this.mainInfo = const PlaceMain.none(),
    this.rules = const PlaceRules.none(),
    this.district = 'district',
    // this.services = const [],
  });

  static PlaceMain _fromJsonMain(Map<String, dynamic>? json) =>
      json == null ? const PlaceMain.none() : PlaceMain.fromJson(json);
  static String _toJsonMain(PlaceMain object) => object.toString();

  static PlaceRules _fromJsonRules(Map<String, dynamic>? json) =>
      json == null ? const PlaceRules.none() : PlaceRules.fromJson(json);
  static String _toJsonRules(PlaceRules object) => object.toString();

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDetailsToJson(this);
}

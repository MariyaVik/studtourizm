import 'package:json_annotation/json_annotation.dart';

import 'place_committee.dart';

part 'place_rules.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceRules {
  @JsonKey(defaultValue: 'requiredUniDocuments')
  final String requiredUniDocuments;
  @JsonKey(defaultValue: 'requiredStudentsDocuments')
  final String requiredStudentsDocuments;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final PlaceCommittee committee;

  PlaceRules({
    required this.requiredStudentsDocuments,
    required this.requiredUniDocuments,
    required this.committee,
  });

  const PlaceRules.none({
    this.committee = const PlaceCommittee.none(),
    this.requiredStudentsDocuments = 'requiredStudentsDocuments',
    this.requiredUniDocuments = 'requiredUniDocuments',
  });

  static PlaceCommittee _fromJson(Map<String, dynamic>? json) => json == null
      ? const PlaceCommittee.none()
      : PlaceCommittee.fromJson(json);
  static String _toJson(PlaceCommittee object) => object.toString();

  factory PlaceRules.fromJson(Map<String, dynamic> json) =>
      _$PlaceRulesFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceRulesToJson(this);
}

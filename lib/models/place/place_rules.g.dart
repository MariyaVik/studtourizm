// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceRules _$PlaceRulesFromJson(Map<String, dynamic> json) => PlaceRules(
      requiredStudentsDocuments: json['requiredStudentsDocuments'] as String? ??
          'requiredStudentsDocuments',
      requiredUniDocuments:
          json['requiredUniDocuments'] as String? ?? 'requiredUniDocuments',
      committee:
          PlaceRules._fromJson(json['committee'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$PlaceRulesToJson(PlaceRules instance) =>
    <String, dynamic>{
      'requiredUniDocuments': instance.requiredUniDocuments,
      'requiredStudentsDocuments': instance.requiredStudentsDocuments,
      'committee': PlaceRules._toJson(instance.committee),
    };

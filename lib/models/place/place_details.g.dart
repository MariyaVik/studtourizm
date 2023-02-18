// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) => PlaceDetails(
      mainInfo: PlaceDetails._fromJsonMain(
          json['main-info'] as Map<String, dynamic>?),
      rules:
          PlaceDetails._fromJsonRules(json['rules'] as Map<String, dynamic>?),
      documents: json['documents'] as List<dynamic>? ?? [],
      district: json['district'] as String? ?? 'district',
    );

Map<String, dynamic> _$PlaceDetailsToJson(PlaceDetails instance) =>
    <String, dynamic>{
      'main-info': PlaceDetails._toJsonMain(instance.mainInfo),
      'rules': PlaceDetails._toJsonRules(instance.rules),
      'documents': instance.documents,
      'district': instance.district,
    };

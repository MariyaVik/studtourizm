// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      details: Place._fromJson(json['details'] as Map<String, dynamic>?),
      id: json['id'] as String? ?? 'id',
      universityId: json['universityId'] as String? ?? 'universityId',
      rasstoyanie: (json['rasstoyanie'] as num?)?.toDouble() ?? 6.2,
      nameVuz: json['name_vuz'] as String? ?? 'nameVuz',
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'details': Place._toJson(instance.details),
      'id': instance.id,
      'universityId': instance.universityId,
      'name_vuz': instance.nameVuz,
      'rasstoyanie': instance.rasstoyanie,
    };

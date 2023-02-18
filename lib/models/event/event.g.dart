// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      details: Event._fromJson(json['details'] as Map<String, dynamic>?),
      universityId: json['universityId'] as String? ?? 'universityId',
      nameVuz: json['name_vuz'] as String? ?? 'nameVuz',
      id: json['id'] as String? ?? 'id',
      latitude:
          json['geo_lat'] == null ? 0 : Event._fromJsonCoord(json['geo_lat']),
      longitude:
          json['geo_lon'] == null ? 0 : Event._fromJsonCoord(json['geo_lon']),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'details': instance.details,
      'universityId': instance.universityId,
      'name_vuz': instance.nameVuz,
      'id': instance.id,
      'geo_lat': instance.latitude,
      'geo_lon': instance.longitude,
    };

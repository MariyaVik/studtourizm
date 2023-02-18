// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      details: Event._fromJson(json['details'] as Map<String, dynamic>?),
      universityId: json['universityId'] as String? ?? 'universityId',
      id: json['id'] as String? ?? 'id',
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'details': instance.details,
      'universityId': instance.universityId,
      'id': instance.id,
    };

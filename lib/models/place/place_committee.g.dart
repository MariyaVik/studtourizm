// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_committee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceCommittee _$PlaceCommitteeFromJson(Map<String, dynamic> json) =>
    PlaceCommittee(
      email: json['email'] as String? ?? 'email',
      name: json['name'] as String? ?? 'name',
      phone: json['phone'] as String? ?? 'phone',
    );

Map<String, dynamic> _$PlaceCommitteeToJson(PlaceCommittee instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };

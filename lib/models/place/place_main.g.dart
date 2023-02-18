// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceMain _$PlaceMainFromJson(Map<String, dynamic> json) => PlaceMain(
      city: json['city'] as String? ?? 'city',
      coordinates:
          PlaceMain._fromJson(json['coordinates'] as Map<String, dynamic>?),
      houseNumber: json['houseNumber'] as String? ?? 'houseNumber',
      maxDays: json['maxDays'] as String? ?? 'maxDays',
      mealPlan: json['mealPlan'] as String? ?? 'mealPlan',
      minDays: json['minDays'] as String? ?? 'minDays',
      name: json['name'] as String? ?? 'name',
      photos: json['photos'] as List<dynamic>? ?? [],
      street: json['street'] as String? ?? 'street',
    );

Map<String, dynamic> _$PlaceMainToJson(PlaceMain instance) => <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'coordinates': PlaceMain._toJson(instance.coordinates),
      'mealPlan': instance.mealPlan,
      'minDays': instance.minDays,
      'maxDays': instance.maxDays,
      'photos': instance.photos,
    };

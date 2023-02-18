// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceService _$PlaceServiceFromJson(Map<String, dynamic> json) => PlaceService(
      description: json['description'] as String? ?? 'description',
      id: json['id'] as String? ?? 'id',
      isFree: json['isFree'] as bool? ?? true,
      price: json['price'] as String? ?? 'price',
      name: json['name'] as String? ?? 'name',
    );

Map<String, dynamic> _$PlaceServiceToJson(PlaceService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isFree': instance.isFree,
      'id': instance.id,
      'price': instance.price,
      'description': instance.description,
    };

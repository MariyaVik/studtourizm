// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_coord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceCoord _$PlaceCoordFromJson(Map<String, dynamic> json) => PlaceCoord(
      latitude: json['lat'] == null ? 0 : PlaceCoord._fromJson(json['lat']),
      longitude: json['lng'] == null ? 0 : PlaceCoord._fromJson(json['lng']),
    );

Map<String, dynamic> _$PlaceCoordToJson(PlaceCoord instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lng': instance.longitude,
    };

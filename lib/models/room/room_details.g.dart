// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDetails _$RoomDetailsFromJson(Map<String, dynamic> json) => RoomDetails(
      dateRange:
          RoomDetails._fromJson(json['dateRange'] as Map<String, dynamic>?),
      type: json['type'] as String? ?? 'type',
      isFree: json['isFree'] as bool? ?? false,
      amount: json['amount'] as String? ?? 'amount',
      price: json['price'] as String? ?? 'price',
      description: json['description'] as String? ?? 'description',
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$RoomDetailsToJson(RoomDetails instance) =>
    <String, dynamic>{
      'dateRange': instance.dateRange,
      'type': instance.type,
      'isFree': instance.isFree,
      'amount': instance.amount,
      'price': instance.price,
      'description': instance.description,
      'photos': instance.photos,
    };

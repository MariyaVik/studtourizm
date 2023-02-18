// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetails _$EventDetailsFromJson(Map<String, dynamic> json) => EventDetails(
      dates: EventDetails._fromJson(json['dates'] as Map<String, dynamic>?),
      name: json['name'] as String? ?? 'name',
      link: json['link'] as String? ?? 'link',
      price: json['price'] as String? ?? 'price',
      description: json['description'] as String? ?? 'description',
      video:
          (json['video'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      type: json['type'] as String? ?? 'type',
      woS: json['woS'] as String? ?? 'woS',
    );

Map<String, dynamic> _$EventDetailsToJson(EventDetails instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'name': instance.name,
      'link': instance.link,
      'price': instance.price,
      'description': instance.description,
      'video': instance.video,
      'photos': instance.photos,
      'type': instance.type,
      'woS': instance.woS,
    };

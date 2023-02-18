// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDates _$EventDatesFromJson(Map<String, dynamic> json) => EventDates(
      from: EventDates._fromJson(json['from'] as int?),
      to: EventDates._fromJson(json['to'] as int?),
      isRegular: json['isRegular'] as bool? ?? false,
    );

Map<String, dynamic> _$EventDatesToJson(EventDates instance) =>
    <String, dynamic>{
      'from': EventDates._toJson(instance.from),
      'to': EventDates._toJson(instance.to),
      'isRegular': instance.isRegular,
    };

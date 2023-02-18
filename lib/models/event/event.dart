import 'package:json_annotation/json_annotation.dart';

import 'event_details.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(fromJson: _fromJson)
  EventDetails? details;
  @JsonKey(defaultValue: 'universityId')
  final String universityId;
  @JsonKey(defaultValue: 'nameVuz', name: 'name_vuz')
  final String nameVuz;
  @JsonKey(defaultValue: 'id')
  final String id;
  @JsonKey(name: 'geo_lat', defaultValue: 0, fromJson: _fromJsonCoord)
  final double latitude;
  @JsonKey(name: 'geo_lon', defaultValue: 0, fromJson: _fromJsonCoord)
  final double longitude;

  Event({
    required this.details,
    required this.universityId,
    required this.nameVuz,
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  Event.none({
    this.details,
    this.id = 'id',
    this.universityId = 'universityId',
    this.nameVuz = 'nameVuz',
    this.latitude = 0,
    this.longitude = 0,
  }) {
    details ??= EventDetails.none();
  }

  static EventDetails _fromJson(Map<String, dynamic>? json) =>
      json == null ? EventDetails.none() : EventDetails.fromJson(json);

  static double _fromJsonCoord(coord) =>
      coord is String ? double.parse(coord) : coord;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

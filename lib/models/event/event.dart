import 'package:json_annotation/json_annotation.dart';

import 'event_details.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(fromJson: _fromJson)
  EventDetails? details;
  @JsonKey(defaultValue: 'universityId')
  final String universityId;
  @JsonKey(defaultValue: 'id')
  final String id;

  Event({
    required this.details,
    required this.universityId,
    required this.id,
  });

  Event.none(
      {this.details, this.id = 'id', this.universityId = 'universityId'}) {
    details ??= EventDetails.none();
  }

  static EventDetails _fromJson(Map<String, dynamic>? json) =>
      json == null ? EventDetails.none() : EventDetails.fromJson(json);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

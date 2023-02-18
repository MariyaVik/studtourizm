import 'package:json_annotation/json_annotation.dart';

part 'event_dates.g.dart';

@JsonSerializable()
class EventDates {
  @JsonKey(toJson: _toJson, fromJson: _fromJson)
  final DateTime from;
  @JsonKey(toJson: _toJson, fromJson: _fromJson)
  final DateTime to;
  @JsonKey(defaultValue: false)
  final bool isRegular;

  const EventDates({
    required this.from,
    required this.to,
    required this.isRegular,
  });

  static int _toJson(DateTime value) => value.millisecondsSinceEpoch;
  static DateTime _fromJson(int? value) => value == null
      ? DateTime(1970)
      : DateTime.fromMillisecondsSinceEpoch(value);

  factory EventDates.fromJson(Map<String, dynamic> json) =>
      _$EventDatesFromJson(json);
  Map<String, dynamic> toJson() => _$EventDatesToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'event_dates.dart';

part 'event_details.g.dart';

@JsonSerializable()
class EventDetails {
  @JsonKey(fromJson: _fromJson)
  EventDates? dates;
  @JsonKey(defaultValue: 'name')
  final String name;
  @JsonKey(defaultValue: 'link')
  final String link;
  @JsonKey(defaultValue: 'price')
  final String price;
  @JsonKey(defaultValue: 'description')
  final String description;
  @JsonKey(defaultValue: [])
  final List<String> video;
  @JsonKey(defaultValue: [])
  final List<String> photos;
  @JsonKey(defaultValue: 'type')
  final String type;
  @JsonKey(defaultValue: 'woS')
  final String woS;

  EventDetails({
    required this.dates,
    required this.name,
    required this.link,
    required this.price,
    required this.description,
    required this.video,
    required this.photos,
    required this.type,
    required this.woS,
  });
  EventDetails.none(
      {this.dates,
      this.description = 'description',
      this.link = 'link',
      this.name = 'name',
      this.photos = const [],
      this.price = 'price',
      this.type = 'type',
      this.video = const [],
      this.woS = 'woS'}) {
    dates ??=
        EventDates(from: DateTime(1970), to: DateTime(1970), isRegular: false);
  }

  static EventDates _fromJson(Map<String, dynamic>? json) => json == null
      ? EventDates(from: DateTime(1970), to: DateTime(1970), isRegular: false)
      : EventDates.fromJson(json);

  factory EventDetails.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$EventDetailsToJson(this);
}

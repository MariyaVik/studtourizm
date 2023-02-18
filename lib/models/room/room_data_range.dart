import 'package:json_annotation/json_annotation.dart';
part 'room_data_range.g.dart';

@JsonSerializable()
class RoomDateRange {
  @JsonKey(defaultValue: 0)
  final int from;
  @JsonKey(defaultValue: 0)
  final int to;

  RoomDateRange({required this.from, required this.to});
  const RoomDateRange.none({this.from = 0, this.to = 0});
  factory RoomDateRange.fromJson(Map<String, dynamic> json) =>
      _$RoomDateRangeFromJson(json);
  Map<String, dynamic> toJson() => _$RoomDateRangeToJson(this);
}

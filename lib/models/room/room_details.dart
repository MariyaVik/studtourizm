import 'package:json_annotation/json_annotation.dart';

import 'room_data_range.dart';
part 'room_details.g.dart';

@JsonSerializable()
class RoomDetails {
  @JsonKey(fromJson: _fromJson)
  final RoomDateRange dateRange;
  @JsonKey(defaultValue: 'type')
  final String type;
  @JsonKey(defaultValue: false)
  final bool isFree;
  @JsonKey(defaultValue: 'amount')
  final String amount;
  @JsonKey(defaultValue: 'price')
  final String price;
  @JsonKey(defaultValue: 'description')
  final String description;
  @JsonKey(defaultValue: [])
  final List<String> photos;

  RoomDetails(
      {required this.dateRange,
      required this.type,
      required this.isFree,
      required this.amount,
      required this.price,
      required this.description,
      required this.photos});

  const RoomDetails.none(
      {this.amount = 'amount',
      this.dateRange = const RoomDateRange.none(),
      this.description = 'description',
      this.isFree = false,
      this.photos = const [],
      this.price = 'price',
      this.type = 'type'});

  static RoomDateRange _fromJson(Map<String, dynamic>? json) =>
      json == null ? const RoomDateRange.none() : RoomDateRange.fromJson(json);

  factory RoomDetails.fromJson(Map<String, dynamic> json) =>
      _$RoomDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$RoomDetailsToJson(this);
}

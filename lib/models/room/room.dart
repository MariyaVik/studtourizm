import 'package:json_annotation/json_annotation.dart';

import 'room_details.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(fromJson: _fromJson)
  final RoomDetails details;
  // String dormitoryId;
  // String universityId;

  Room({
    required this.details,
    // required this.dormitoryId,
    // required this.universityId,
  });

  const Room.none({this.details = const RoomDetails.none()});

  static RoomDetails _fromJson(Map<String, dynamic>? json) =>
      json == null ? const RoomDetails.none() : RoomDetails.fromJson(json);

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

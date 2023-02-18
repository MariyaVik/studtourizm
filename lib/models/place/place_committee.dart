import 'package:json_annotation/json_annotation.dart';

part 'place_committee.g.dart';

@JsonSerializable()
class PlaceCommittee {
  @JsonKey(defaultValue: 'name')
  final String name;
  @JsonKey(defaultValue: 'phone')
  final String phone;
  @JsonKey(defaultValue: 'email')
  final String email;

  PlaceCommittee({
    required this.email,
    required this.name,
    required this.phone,
  });

  const PlaceCommittee.none(
      {this.email = 'email', this.name = 'name', this.phone = 'phone'});

  factory PlaceCommittee.fromJson(Map<String, dynamic> json) =>
      _$PlaceCommitteeFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceCommitteeToJson(this);
}

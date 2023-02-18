import 'package:json_annotation/json_annotation.dart';

part 'place_service.g.dart';

@JsonSerializable()
class PlaceService {
  @JsonKey(defaultValue: 'name')
  final String name;
  @JsonKey(defaultValue: true)
  final bool isFree;
  @JsonKey(defaultValue: 'id')
  final String id;
  @JsonKey(defaultValue: 'price')
  final String price;
  @JsonKey(defaultValue: 'description')
  final String description;

  PlaceService({
    required this.description,
    required this.id,
    required this.isFree,
    required this.price,
    required this.name,
  });

  const PlaceService.none({
    this.description = 'description',
    this.id = 'id',
    this.isFree = true,
    this.price = 'price',
    this.name = 'name',
  });

  factory PlaceService.fromJson(Map<String, dynamic> json) =>
      _$PlaceServiceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceServiceToJson(this);
}

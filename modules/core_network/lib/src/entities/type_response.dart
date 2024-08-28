// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'type_response.g.dart';

@JsonSerializable()
class TypeResponse {
  @JsonKey(name: '_id')
  String id;
  String typeName;
  String color;
  DateTime createdAt;
  DateTime updatedAt;

  TypeResponse({
    required this.id,
    required this.typeName,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TypeResponse.fromJson(Map<String, dynamic> json) {
    return _$TypeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);
}

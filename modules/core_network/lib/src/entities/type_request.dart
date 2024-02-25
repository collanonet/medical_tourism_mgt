import 'package:json_annotation/json_annotation.dart';

part 'type_request.g.dart';

@JsonSerializable()
class TypeRequest {
  String typeName;
  String color;

  TypeRequest({
    required this.typeName,
    required this.color,
  });

  factory TypeRequest.fromJson(Map<String, dynamic> json) {
    return _$TypeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeRequestToJson(this);
}
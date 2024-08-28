// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'contrant_agent_response.g.dart';

@JsonSerializable()
class ContrantAgentResponse {
  @JsonKey(name: '_id')
  final String id;
  String? uploadFile;
  String? fileName;
  DateTime? uploadOn;
  DateTime? createdAt;
  DateTime? updatedAt;

  ContrantAgentResponse({
    required this.id,
    this.uploadFile,
    this.fileName,
    this.uploadOn,
    this.createdAt,
    this.updatedAt,
  });

  factory ContrantAgentResponse.fromJson(Map<String, dynamic> json) {
    return _$ContrantAgentResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ContrantAgentResponseToJson(this);
  }
}

import 'package:json_annotation/json_annotation.dart';
part 'contrant_agent_request.g.dart';
@JsonSerializable()
class ContrantAgentRequest{
  String? uploadFile;
  String? fileName;
  DateTime? uploadOn;
  String agentRecord;

  ContrantAgentRequest({
    this.uploadFile,
    this.fileName,
    this.uploadOn,
    required this.agentRecord,
  });
  factory ContrantAgentRequest.fromJson(Map<String, dynamic> json) => _$ContrantAgentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ContrantAgentRequestToJson(this);
}
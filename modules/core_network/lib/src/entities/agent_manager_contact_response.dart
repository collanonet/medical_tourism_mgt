import 'package:json_annotation/json_annotation.dart';

part 'agent_manager_contact_response.g.dart';

@JsonSerializable()
class AgentManagerContactResponse {
  @JsonKey(name: '_id')
  final String id;
  String? howToContact;
  String? howToContactQrCode;


  AgentManagerContactResponse({
    required this.id,
    this.howToContact,
    this.howToContactQrCode,
  });

  factory AgentManagerContactResponse.fromJson(Map<String, dynamic> json) {
    return _$AgentManagerContactResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentManagerContactResponseToJson(this);
}

// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'agent_manager_contact_request.g.dart';

@JsonSerializable()
class AgentManagerContactRequest {
  @JsonKey(name: '_id')
  String? id;
  String? howToContact;
  String? howToContactQrCode;

  AgentManagerContactRequest({
    this.id,
    this.howToContact,
    this.howToContactQrCode,
  });


  factory AgentManagerContactRequest.fromJson(Map<String, dynamic> json) {
    return _$AgentManagerContactRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentManagerContactRequestToJson(this);
}

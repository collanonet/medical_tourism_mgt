import 'package:json_annotation/json_annotation.dart';

part 'send_invitation_request.g.dart';

@JsonSerializable()
class SendInvitationRequest {
  String phoneNumber;
  String fullName;
  String? nationalId;

  SendInvitationRequest({
    required this.fullName,
    required this.phoneNumber,
    this.nationalId,
  });

  factory SendInvitationRequest.fromJson(Map<String, dynamic> json) {
    return _$SendInvitationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendInvitationRequestToJson(this);
}

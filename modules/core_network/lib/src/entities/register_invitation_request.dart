import 'package:json_annotation/json_annotation.dart';

part 'register_invitation_request.g.dart';

@JsonSerializable()
class RegisterInvitationRequest {
  String fullName;
  String phoneNumber;
  String digitCode;
  String? nationalId;

  RegisterInvitationRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.digitCode,
    this.nationalId,
  });

  factory RegisterInvitationRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterInvitationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterInvitationRequestToJson(this);
}

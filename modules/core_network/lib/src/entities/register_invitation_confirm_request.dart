import 'package:json_annotation/json_annotation.dart';

part 'register_invitation_confirm_request.g.dart';

@JsonSerializable()
class RegisterInvitationConfirmRequest {
  String referenceData;
  String code;
  String pin;

  RegisterInvitationConfirmRequest({
    required this.referenceData,
    required this.code,
    required this.pin,
  });

  factory RegisterInvitationConfirmRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterInvitationConfirmRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterInvitationConfirmRequestToJson(this);
}

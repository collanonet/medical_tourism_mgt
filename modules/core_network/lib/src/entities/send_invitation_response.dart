import 'package:json_annotation/json_annotation.dart';

part 'send_invitation_response.g.dart';

@JsonSerializable()
class SendInvitationResponse {
  String id;
  String code;
  String? expiredIn;

  SendInvitationResponse({
    required this.id,
    required this.code,
    this.expiredIn,
  });

  factory SendInvitationResponse.fromJson(Map<String, dynamic> json) {
    return _$SendInvitationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendInvitationResponseToJson(this);
}

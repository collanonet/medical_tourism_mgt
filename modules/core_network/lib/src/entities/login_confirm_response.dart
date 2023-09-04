import 'package:json_annotation/json_annotation.dart';

part 'login_confirm_response.g.dart';

@JsonSerializable()
class LoginConfirmResponse {
  String accessToken;
  String refreshToken;
  int expireIn;
  bool requiredPinChange;
  String? deviceId;

  LoginConfirmResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expireIn,
    required this.requiredPinChange,
    this.deviceId,
  });

  factory LoginConfirmResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginConfirmResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginConfirmResponseToJson(this);
}

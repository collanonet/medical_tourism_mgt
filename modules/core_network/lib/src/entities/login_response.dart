import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String referenceData;
  bool success;
  int expireIn;
  bool requiredPinChange;
  bool isTrustedDevice;
  String? deviceId;
  String? accessToken;
  String? refreshToken;

  LoginResponse({
    required this.referenceData,
    required this.success,
    required this.expireIn,
    required this.requiredPinChange,
    required this.isTrustedDevice,
    this.deviceId,
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  String accessToken;
  String refreshToken;
  int expireIn;
  String? deviceId;
  String? referenceData;
  bool isTrustedDevice;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    required this.expireIn,
    this.deviceId,
    this.referenceData,
    this.isTrustedDevice = false,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return _$AuthDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

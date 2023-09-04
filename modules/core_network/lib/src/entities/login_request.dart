import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String phoneNumber;
  String pin;
  String deviceId;

  LoginRequest({
    required this.phoneNumber,
    required this.pin,
    required this.deviceId,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

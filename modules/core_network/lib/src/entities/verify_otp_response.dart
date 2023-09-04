import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  String referenceData;
  bool success;

  VerifyOtpResponse({
    required this.referenceData,
    required this.success,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}

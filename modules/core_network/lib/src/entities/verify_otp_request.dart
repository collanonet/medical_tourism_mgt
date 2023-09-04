import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request.g.dart';

@JsonSerializable()
class VerifyOtpRequest {
  String referenceData;
  String code;

  VerifyOtpRequest({
    required this.referenceData,
    required this.code,
  });

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyOtpRequestToJson(this);
}

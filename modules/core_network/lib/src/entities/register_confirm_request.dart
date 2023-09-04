import 'package:json_annotation/json_annotation.dart';

part 'register_confirm_request.g.dart';

@JsonSerializable()
class RegisterConfirmRequest {
  String referenceData;
  String code;
  String pin;

  RegisterConfirmRequest({
    required this.referenceData,
    required this.code,
    required this.pin,
  });

  factory RegisterConfirmRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterConfirmRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterConfirmRequestToJson(this);
}

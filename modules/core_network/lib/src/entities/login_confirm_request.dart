import 'package:json_annotation/json_annotation.dart';

part 'login_confirm_request.g.dart';

@JsonSerializable()
class LoginConfirmRequest {
  String referenceData;
  String code;

  LoginConfirmRequest({
    required this.referenceData,
    required this.code,
  });

  factory LoginConfirmRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginConfirmRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginConfirmRequestToJson(this);
}

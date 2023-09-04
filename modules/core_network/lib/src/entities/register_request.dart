import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String phoneNumber;
  String refererCode;

  RegisterRequest({
    required this.phoneNumber,
    required this.refererCode,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

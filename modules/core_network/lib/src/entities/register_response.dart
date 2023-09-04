import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String referenceData;

  RegisterResponse({
    required this.referenceData,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

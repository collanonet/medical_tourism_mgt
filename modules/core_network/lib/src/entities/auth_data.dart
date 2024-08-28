// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'user.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  final User user;
  final String accessToken;
  final String refreshToken;

  AuthData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return _$AuthDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

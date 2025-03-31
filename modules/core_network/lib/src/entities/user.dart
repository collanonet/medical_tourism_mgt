// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../entities.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  String fullName;
  String? email;
  String idNumber;
  String? profileImage;
  String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PermissionRole role;
  final bool isClosed;
  final Patient? patient;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.idNumber,
    required this.profileImage,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    this.isClosed = false,
    this.patient,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

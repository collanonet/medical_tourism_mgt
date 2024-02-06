import 'package:json_annotation/json_annotation.dart';
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

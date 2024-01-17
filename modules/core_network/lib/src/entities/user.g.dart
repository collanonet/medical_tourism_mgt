// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      $enumDecode(_$PermissionRoleEnumMap, json['role']),
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      idNumber: json['idNumber'] as String,
      profileImage: json['profileImage'] as String,
      phoneNumber: json['phoneNumber'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'idNumber': instance.idNumber,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': _$PermissionRoleEnumMap[instance.role]!,
    };

const _$PermissionRoleEnumMap = {
  PermissionRole.guest: 'ROLE_GUEST',
  PermissionRole.admin: 'Admin',
  PermissionRole.hospital: 'Hospital',
  PermissionRole.agent: 'Agent',
  PermissionRole.patient: 'Patient',
};

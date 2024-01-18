// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      credentials:
          Credentials.fromJson(json['credentials'] as Map<String, dynamic>),
      role: $enumDecode(_$PermissionRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'role': _$PermissionRoleEnumMap[instance.role]!,
    };

const _$PermissionRoleEnumMap = {
  PermissionRole.guest: 'ROLE_GUEST',
  PermissionRole.admin: 'Admin',
  PermissionRole.hospital: 'Hospital',
  PermissionRole.agent: 'Agent',
  PermissionRole.patient: 'Patient',
};

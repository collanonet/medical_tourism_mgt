import '../entities/permission_role.dart';

const _dataMap = {
  PermissionRole.guest: 'ROLE_GUEST',
  PermissionRole.user: 'ROLE_USER',
};

String? encodeRole(PermissionRole? role) {
  if (role == null) return null;
  return _dataMap[role];
}

PermissionRole? decodeRole(String? value) {
  if (value == null) return null;

  return _dataMap.entries.firstWhere((element) => element.value == value).key;
}

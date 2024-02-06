import 'package:core_network/entities.dart';

const _dataMap = {
  PermissionRole.guest: 'ROLE_GUEST',
  PermissionRole.admin: 'Admin',
  PermissionRole.hospital: 'Hospital',
  PermissionRole.agent: 'Agent',
  PermissionRole.patient: 'Patient',
};

String? encodeRole(PermissionRole? role) {
  if (role == null) return null;
  return _dataMap[role];
}

PermissionRole? decodeRole(String? value) {
  if (value == null) return null;

  try {
    return _dataMap.entries.firstWhere((element) => element.value == value).key;
  } catch (e) {
    return null;
  }
}

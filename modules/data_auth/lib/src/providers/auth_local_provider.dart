import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_storage/core_storage.dart';
import 'package:injectable/injectable.dart';

import '../entities/index.dart';
import '../utils/permission_roles.dart';
import 'authz_provider.dart';

@Named('localAuthz')
@Injectable(as: AuthzProvider)
class AuthzLocalProvider extends AuthzProvider {
  AuthzLocalProvider({
    @Named('authzStorage') required this.storage,
  });

  final Storage storage;

  final _accessTokenStorageKey = 'access_token';
  final _refreshTokenStorageKey = 'refresh_token';
  final _permissionRoleStorageKey = 'permission_role';
  final _referenceData = 'reference_data';
  final _freshInstall = 'fresh_install';
  final _hasLegacy = 'has_legacy';
  final _deviceId = 'device_id';

  @override
  Future<String?> getReferenceData() {
    return storage.read(_referenceData);
  }

  @override
  void setReferenceData(String value) async {
    await storage.write(_referenceData, value);
  }

  @override
  void setHasLegacy(bool value) async {
    await storage.write(_hasLegacy, value ? '1' : '0');
  }

  @override
  Future<String?> getDeviceId() {
    return storage.read(_deviceId);
  }

  @override
  void setDeviceId(String value) async {
    await storage.write(_deviceId, value);
  }

  @override
  Future<String?> getAccessToken() {
    return storage.read(_accessTokenStorageKey);
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(_refreshTokenStorageKey);
  }

  @override
  Future<PermissionRole?> getPermissionRole() async {
    return decodeRole(await storage.read(_permissionRoleStorageKey));
  }

  @override
  Future<void> handleAuthResponse(AuthResponse response) {
    final credentials = response.credentials;
    final role = response.role;

    return Future.wait([
      storage.write(_accessTokenStorageKey, credentials.accessToken),
      storage.write(_refreshTokenStorageKey, credentials.refreshToken),
      storage.write(_permissionRoleStorageKey, encodeRole(role)),
    ]);
  }

  @override
  Future<Credentials> refreshToken(String token) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> login(String phoneNumber, String pin, String deviceId) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> confirmLogin(String referenceData, String code) {
    throw UnimplementedError();
  }

  @override
  Future<void> clearStore() {
    return Future.wait([
      storage.write(_accessTokenStorageKey, null),
      storage.write(_refreshTokenStorageKey, null),
      storage.write(_permissionRoleStorageKey, null),
    ]);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(String referenceData, String code) {
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyPin(String pin) {
    throw UnimplementedError();
  }

  @override
  Future<String> startRegister(String phoneNumber, String? referralCode) {
    throw UnimplementedError();
  }

  @override
  Future<String> invitationRegister(
    String fullName,
    String phoneNumber,
    String inviteCode,
    String? nationalId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isFreshInstall() async {
    var value = await storage.read(_freshInstall) ?? '1';
    return value == '1';
  }

  @override
  Future<void> updateFreshInstall() => storage.write(_freshInstall, '0');

  @override
  Future<String> resendOtp(String referenceData) {
    throw UnimplementedError();
  }

  @override
  Future<BankAccount> verifyAccount(
      String referenceData, String accountNumber) {
    throw UnimplementedError();
  }

  @override
  Future<RegisterConfirmResponse> finishRegister(
      String referenceData, String code, String pin) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> finishInvitationRegister(
      String referenceData, String code, String pin) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> onboardLegacyBusiness(
      String referenceData, List<LegacyBusiness> businessLegacy) {
    throw UnimplementedError();
  }

  @override
  Future<AuthData> onboardBusiness(
      String referenceData, OnboardBusinessRequest onboardBusinessRequest) {
    throw UnimplementedError();
  }

  @override
  Future<bool> changePin(String oldPin, String newPin) {
    throw UnimplementedError();
  }
}

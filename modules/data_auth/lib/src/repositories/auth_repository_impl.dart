import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../entities/index.dart';
import '../exceptions/expired_token_exception.dart';
import '../providers/authz_provider.dart';
import 'authz_repository.dart';

@Injectable(as: AuthzRepository)
class AuthzRepositoryImpl extends AuthzRepository {
  AuthzRepositoryImpl({
    @Named('localAuthz') required this.local,
    @Named('remoteAuthz') required this.remote,
  });

  final AuthzProvider local;
  final AuthzProvider remote;

  @override
  Future<String?> getAccessToken() {
    return local.getAccessToken();
  }

  @override
  Future<String?> getDeviceId() {
    return local.getDeviceId();
  }

  @override
  Future<String?> getReferenceData() {
    return local.getReferenceData();
  }

  @override
  Future<Credentials> refreshToken() async {
    try {
      final token = await local.getRefreshToken();
      if (token == null) throw ExpiredTokenException();

      return remote.refreshToken(token);
    } catch (e) {
      throw ExpiredTokenException();
    }
  }

  @override
  Future<PermissionRole> getPermissionRole() async {
    return await local.getPermissionRole() ?? PermissionRole.guest;
  }

  @override
  Future<AuthData> signIn(String phoneNumber, String pin) async {
    final currentDeviceId = await local.getDeviceId() ?? '';
    final response = await remote.login(
      phoneNumber.replaceAll(RegExp(r'\s+'), ''),
      pin,
      currentDeviceId,
    );
    var trusted = response.isTrustedDevice;
    var deviceId = response.deviceId;
    if (deviceId != null) {
      local.setDeviceId(deviceId);
    }
    await local.handleAuthResponse(AuthResponse(
      credentials: Credentials(
        refreshToken: response.refreshToken,
        accessToken: response.accessToken,
      ),
      role: trusted ? PermissionRole.user : PermissionRole.guest,
    ));
    await local.updateFreshInstall();
    return response;
  }

  @override
  Future<AuthData> confirmLogin(String referenceData, String code) async {
    final response = await remote.confirmLogin(referenceData, code);
    var deviceId = response.deviceId;
    if (deviceId != null) {
      local.setDeviceId(deviceId);
    }
    await local.handleAuthResponse(AuthResponse(
      credentials: Credentials(
        refreshToken: response.refreshToken,
        accessToken: response.accessToken,
      ),
      role: PermissionRole.user,
    ));
    return response;
  }

  @override
  Future<void> signOut() {
    return local.clearStore();
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(String referenceData, String code) {
    return remote.verifyOtp(referenceData, code);
  }

  @override
  Future<String> startRegister(String phoneNumber, String? referralCode) {
    return remote.startRegister(
        phoneNumber.replaceAll(RegExp(r'\s+'), ''), referralCode);
  }

  @override
  Future<String> invitationRegister(String fullName, String phoneNumber,
      String inviteCode, String? nationalId) {
    return remote.invitationRegister(
      fullName,
      phoneNumber.replaceAll(RegExp(r'\s+'), ''),
      inviteCode,
      nationalId,
    );
  }

  @override
  Future<String> resendOtp(String referenceData) {
    return remote.resendOtp(referenceData);
  }

  @override
  Future<bool> verifyPin(String pin) async {
    return remote.verifyPin(pin);
  }

  @override
  Future<bool> isFreshInstall() => local.isFreshInstall();

  @override
  Future<BankAccount> verifyAccount(
      String referenceData, String accountNumber) {
    return remote.verifyAccount(referenceData, accountNumber);
  }

  @override
  Future<RegisterConfirmResponse> finishRegister(
      String referenceData, String code, String pin) async {
    final response = await remote.finishRegister(referenceData, code, pin);
    local.setReferenceData(response.referenceData);
    return response;
  }

  @override
  Future<AuthData> finishInvitationRegister(
      String referenceData, String code, String pin) async {
    final resp =
        await remote.finishInvitationRegister(referenceData, code, pin);
    await local.handleAuthResponse(
      AuthResponse(
        credentials: Credentials(
          refreshToken: resp.refreshToken,
          accessToken: resp.accessToken,
        ),
        role: PermissionRole.user,
      ),
    );
    return resp;
  }

  @override
  Future<AuthData> onboardBusiness(
    String referenceData,
      OnboardBusinessRequest onboardBusinessRequest,
  ) async {
    final resp =
        await remote.onboardBusiness(referenceData, onboardBusinessRequest);
    await local.handleAuthResponse(
      AuthResponse(
        credentials: Credentials(
          refreshToken: resp.refreshToken,
          accessToken: resp.accessToken,
        ),
        role: PermissionRole.user,
      ),
    );
    return resp;
  }

  @override
  Future<bool> changePin(String oldPin, String newPin) {
    return remote.changePin(oldPin, newPin);
  }

  @override
  Future<AuthData> onboardBusinessLegacy(
    String referenceData,
    List<LegacyBusiness> business,
  ) async {
    final resp = await remote.onboardLegacyBusiness(referenceData, business);
    await local.handleAuthResponse(
      AuthResponse(
        credentials: Credentials(
          refreshToken: resp.refreshToken,
          accessToken: resp.accessToken,
        ),
        role: PermissionRole.user,
      ),
    );
    return resp;
  }
}

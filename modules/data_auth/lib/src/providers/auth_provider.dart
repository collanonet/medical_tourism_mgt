import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';

import '../entities/index.dart';

abstract class AuthzProvider {
  Future<String?> getReferenceData();

  void setReferenceData(String value);

  void setHasLegacy(bool value);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getDeviceId();

  void setDeviceId(String value);

  Future<PermissionRole?> getPermissionRole();

  Future<Credentials> refreshToken(String token);

  Future<void> handleAuthResponse(AuthResponse response);

  Future<AuthData> login(String phoneNumber, String pin, String deviceId);

  Future<AuthData> confirmLogin(String referenceData, String code);

  Future<void> clearStore();

  Future<String> startRegister(String phoneNumber, String? referralCode);

  Future<String> invitationRegister(
    String fullName,
    String phoneNumber,
    String inviteCode,
    String? nationalId,
  );

  Future<String> resendOtp(String referenceData);

  Future<VerifyOtpResponse> verifyOtp(String referenceData, String code);

  Future<BankAccount> verifyAccount(String referenceData, String accountNumber);

  Future<RegisterConfirmResponse> finishRegister(
      String referenceData, String code, String pin);

  Future<AuthData> finishInvitationRegister(
      String referenceData, String code, String pin);

  Future<AuthData> onboardBusiness(
      String referenceData, OnboardBusinessRequest onboardBusinessRequest);

  Future<AuthData> onboardLegacyBusiness(
      String referenceData, List<LegacyBusiness> businessLegacy);

  Future<bool> verifyPin(String pin);

  Future<bool> isFreshInstall();

  Future<void> updateFreshInstall();

  Future<bool> changePin(String oldPin, String newPin);
}

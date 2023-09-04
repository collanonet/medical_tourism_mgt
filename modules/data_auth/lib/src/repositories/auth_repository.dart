import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';

import '../entities/index.dart';

abstract class AuthzRepository {
  Future<String?> getAccessToken();

  Future<String?> getDeviceId();

  Future<String?> getReferenceData();

  Future<Credentials> refreshToken();

  Future<PermissionRole> getPermissionRole();

  Future<AuthData> signIn(String phoneNumber, String pin);

  Future<AuthData> confirmLogin(String referenceData, String code);

  Future<void> signOut();

  Future<String> startRegister(
    String phoneNumber,
    String? referralCode,
  );

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
    String referenceData,
    String code,
    String pin,
  );

  Future<AuthData> finishInvitationRegister(
    String referenceData,
    String code,
    String pin,
  );

  Future<AuthData> onboardBusiness(
    String referenceData,
    OnboardBusinessRequest onboardBusinessRequest,
  );

  Future<AuthData> onboardBusinessLegacy(
    String referenceData,
    List<LegacyBusiness> business,
  );

  Future<bool> verifyPin(String pin);

  Future<bool> isFreshInstall();

  Future<bool> changePin(String oldPin, String newPin);
}

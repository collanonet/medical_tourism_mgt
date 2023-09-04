import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../../data_auth.dart';
import 'authz_provider.dart';

@Named('remoteAuthz')
@Injectable(as: AuthzProvider)
class AuthzRemoteProvider extends AuthzProvider {
  AuthzRemoteProvider({required this.apiService});

  final ApiService apiService;

  @override
  Future<String?> getReferenceData() {
    throw UnimplementedError();
  }

  @override
  void setReferenceData(String value) {
    throw UnimplementedError();
  }

  @override
  void setHasLegacy(bool value) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeviceId() {
    throw UnimplementedError();
  }

  @override
  void setDeviceId(String value) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getRefreshToken() {
    throw UnimplementedError();
  }

  @override
  Future<PermissionRole?> getPermissionRole() {
    throw UnimplementedError();
  }

  @override
  Future<void> handleAuthResponse(AuthResponse response) {
    throw UnimplementedError();
  }

  @override
  Future<Credentials> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<AuthData> confirmLogin(String referenceData, String code) {
    return apiService
        .confirmLogin(LoginConfirmRequest(
          referenceData: referenceData,
          code: code,
        ))
        .then(
          (value) => AuthData(
            accessToken: value.accessToken,
            refreshToken: value.refreshToken,
            expireIn: value.expireIn,
          ),
        );
  }

  @override
  Future<AuthData> login(String phoneNumber, String pin, String deviceId) {
    return apiService
        .login(LoginRequest(
          phoneNumber: phoneNumber,
          pin: pin,
          deviceId: deviceId,
        ))
        .then(
          (value) => AuthData(
            accessToken: value.accessToken ?? '',
            refreshToken: value.refreshToken ?? '',
            expireIn: value.expireIn,
            isTrustedDevice: value.isTrustedDevice,
            referenceData: value.referenceData,
            deviceId: value.deviceId,
          ),
        );
  }

  @override
  Future<void> clearStore() {
    throw UnimplementedError();
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(String referenceData, String code) {
    return apiService.verifyOtp(VerifyOtpRequest(
      referenceData: referenceData,
      code: code,
    ));
  }

  @override
  Future<String> startRegister(String phoneNumber, String? referralCode) {
    return apiService
        .startRegister(RegisterRequest(
          phoneNumber: phoneNumber,
          refererCode: referralCode ?? '',
        ))
        .then((value) => value.referenceData);
  }

  @override
  Future<String> invitationRegister(
    String fullName,
    String phoneNumber,
    String inviteCode,
    String? nationalId,
  ) {
    return apiService
        .registerWithInviteCode(RegisterInvitationRequest(
          fullName: fullName,
          phoneNumber: phoneNumber,
          digitCode: inviteCode,
          nationalId: nationalId,
        ))
        .then((value) => value.referenceData);
  }

  @override
  Future<String> resendOtp(String referenceData) {
    return apiService.resendOtp(ResendOtpRequest(referenceData: referenceData));
  }

  @override
  Future<bool> verifyPin(String pin) {
    //Todo: Call api service to change pin
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (pin != '123456') {
          false;
        }
        return true;
      },
    );
  }

  @override
  Future<bool> isFreshInstall() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateFreshInstall() {
    throw UnimplementedError();
  }

  @override
  Future<BankAccount> verifyAccount(
    String referenceData,
    String accountNumber,
  ) async {
    final result = await apiService.validateBankAccountOnboard(
      referenceData,
      accountNumber,
    );
    return result.account;
  }

  @override
  Future<RegisterConfirmResponse> finishRegister(
    String referenceData,
    String code,
    String pin,
  ) {
    return apiService.finishRegister(RegisterConfirmRequest(
      referenceData: referenceData,
      code: code,
      pin: pin,
    ));
  }

  @override
  Future<AuthData> finishInvitationRegister(
    String referenceData,
    String code,
    String pin,
  ) {
    return apiService.finishInvitationRegister(RegisterConfirmRequest(
      referenceData: referenceData,
      code: code,
      pin: pin,
    ));
  }

  @override
  Future<AuthData> onboardBusiness(
    String referenceData,
    OnboardBusinessRequest onboardBusinessRequest,
  ) {
    return apiService.onboardNewBusiness(
      onboardBusinessRequest,
    );
  }

  @override
  Future<AuthData> onboardLegacyBusiness(
    String referenceData,
    List<LegacyBusiness> businessLegacy,
  ) {
    return apiService.onboardLegacyBusiness(
      LegacyBusinessRequest(
        referenceData: referenceData,
        businesses: businessLegacy,
      ),
    );
  }

  @override
  Future<bool> changePin(String oldPin, String newPin) {
    //Todo: Call api service to change pin
    return Future.delayed(
      const Duration(seconds: 2),
      () => oldPin == '123456' && newPin == '123457',
    );
  }
}

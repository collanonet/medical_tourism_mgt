import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../core_network.dart';
import '../entities.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(RestClient client) {
    return _ApiService(client.dio, baseUrl: client.baseUrl);
  }

  @GET('/api/addresses/provinces')
  Future<List<Province>> provinces();

  @GET('/api/addresses/provinces/{id}/districts')
  Future<List<District>> districts(
    @Path('id') String id,
  );

  @GET('/api/addresses/districts/{id}/communes')
  Future<List<Commune>> communes(
    @Path('id') String id,
  );

  @GET('/api/addresses/communes/{id}/villages')
  Future<List<Village>> villages(
    @Path('id') String id,
  );

  @POST('/api/merchant/register')
  Future<RegisterResponse> startRegister(@Body() RegisterRequest request);

  @POST('/api/otp/verify')
  Future<VerifyOtpResponse> verifyOtp(@Body() VerifyOtpRequest request);

  @POST('/api/otp/resent')
  Future<String> resendOtp(@Body() ResendOtpRequest request);

  @POST('/api/accounts/validate')
  Future<VerifyAccountResponse> validateBankAccount(
    @Field() String referenceData,
    @Field() String bankAccountNumber,
  );

  @POST('/api/accounts/onboarding-validate')
  Future<VerifyAccountResponse> validateBankAccountOnboard(
    @Field() String referenceData,
    @Field() String bankAccountNumber,
  );

  @POST('/api/merchant/register/confirm')
  Future<RegisterConfirmResponse> finishRegister(
    @Body() RegisterConfirmRequest request,
  );

  @POST('/api/merchant/register/onboard/business')
  Future<AuthData> onboardNewBusiness(
    @Body() OnboardBusinessRequest request,
  );

  @POST('/api/merchant/register/confirm/business')
  Future<AuthData> onboardLegacyBusiness(
    @Body() LegacyBusinessRequest request,
  );

  @POST('/api/merchant/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/api/merchant/login/confirm')
  Future<LoginConfirmResponse> confirmLogin(
    @Body() LoginConfirmRequest request,
  );

  @GET('/api/business/category')
  Future<List<BusinessCategory>> businessCategory();

  @GET('/api/business/category/{id}')
  Future<BusinessCategory> shopType(
    @Path('id') String id,
  );

  @GET('/api/business/mine')
  Future<List<Business>> getBusinesses();

  @GET('/api/business')
  Future<Business> getBusiness();

  @GET('/api/shops')
  Future<Paginated<BaseShop>> getShops(
    @Query('pageNumber') int page,
    @Query('limit') int limit,
  );

  @GET('/api/shops/{shopId}')
  Future<BaseShop> getShop(@Path('shopId') String shopId);

  @GET('/api/counters/shops/{shopId}')
  Future<List<Counter>> getCounters(@Path('shopId') String shopId);

  @GET('/api/counters/shops/{shopId}/{counterId}')
  Future<Counter> getCounter(
    @Path('shopId') String shopId,
    @Path('counterId') String counterId,
  );

  @POST('/api/invitation/register')
  Future<RegisterResponse> registerWithInviteCode(
    @Body() RegisterInvitationRequest request,
  );

  @POST('/api/invitation/register/confirm')
  Future<AuthData> finishInvitationRegister(
    @Body() RegisterConfirmRequest request,
  );

  @GET('/api/counters/shops/{shopId}')
  Future<List<Counter>> getCounterList(
    @Path('shopId') String shopId,
  );

  @POST('/api/invitation/business/co-merchant')
  Future<SendInvitationResponse> sendInvitationAsCoMerchant(
    @Body() SendInvitationRequest request,
  );

  @POST('/api/invitation/shop/{shopId}/supervisor')
  Future<SendInvitationResponse> sendInvitationAsSupervisor(
    @Path('shopId') String shopId,
    @Body() SendInvitationRequest request,
  );

  @POST('/api/invitation/shop/{shopId}/counter/{counterId}/cashier')
  Future<SendInvitationResponse> sendInvitationAsCashier(
    @Path('shopId') String shopId,
    @Path('counterId') String counterId,
    @Body() SendInvitationRequest request,
  );

  @GET('/api/business/overview')
  Future<BusinessOverview> businessOverview();

  @GET('/api/khqr/{id}/status')
  Future<KhqrDetails> getKhqrDetails(@Path('id') String id);

  @POST('/api/khqr/generate')
  Future<Khqr> generateQr(
    @Field() String counterId,
    @Field() String bankAccountId,
    @Field() double amount,
  );

  @GET('/api/employees')
  Future<Paginated<Employee>> getEmployees(
    @Query('role') String role,
    @Query('excludedIds') List<String>? excludedIds,
    @Query('excludedShopId') String? excludedShopId,
    @Query('excludedCounterId') String? excludedCounterId,
    @Query('pageNumber') int pageNumber,
    @Query('limit') int limit,
  );

  @POST('/api/invitation/staff/existence')
  Future<SendInvitationResponse> addStaffExistence(
    @Field('userId') String userId,
    @Field('shopId') String shopId,
    @Field('counterId') String? counterId,
  );

  @POST('/api/shops')
  Future<ShopCreateResponse> createShop(
    @Body() ShopCreateRequest request,
  );

  @DELETE('/api/invitation/{id}')
  Future<void> cancelInvitation(@Path('id') String id);

  @PUT('/api/shops/{shopId}')
  Future<ShopCreateResponse> updateShop(
    @Body() ShopUpdateRequest request,
    @Path('shopId') String shopId,
  );

  @DELETE('/api/shops/{shopId}')
  Future<bool> deleteShop(
    @Path('shopId') String shopId,
  );

  @PUT('/api/shops/{shopId}/enable')
  Future<ShopCreateResponse> enableShop(
    @Path('shopId') String shopId,
  );

  @PUT('/api/shops/{shopId}/disable')
  Future<ShopCreateResponse> disableShop(
    @Path('shopId') String shopId,
  );
}

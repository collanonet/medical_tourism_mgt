import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../core_network.dart';
import 'apis.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(RestClient client) {
    return _ApiService(client.dio, baseUrl: client.baseUrl);
  }

  @POST(Apis.LOG_IN)
  Future<AuthData> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST(Apis.REFRESH_TOKEN)
  Future<AuthData> refreshToken(
    @Field('refresh-token') String refreshToken,
  );

  @POST(Apis.LOG_OUT)
  Future<AuthData> logOut();

  @GET(Apis.GET_PRE_PATIENTS)
  Future<Paginated<PrePatient>> prePatients({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('agents') String? agents,
    @Query('patient') String? patient,
  });
}

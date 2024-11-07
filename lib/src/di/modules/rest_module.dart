import 'package:flutter/foundation.dart';

import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_auth/data_auth.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../app/app_model.dart';
import '../injection.dart';

@module
abstract class RestModule {
  @lazySingleton
  RestClient restClient(
    @Named('baseUrl') Uri baseUrl,
    @Named('apiKey') String apiKey,
    CacheOptions cacheOptions,
  ) {
    return RestClient(baseUrl.toString())
      ..headers.addAll({'Api-Key': apiKey})
      ..addIntercepter(MerchantInterceptor())
      ..addIntercepter(TokenInterceptor())
      ..addIntercepter(ErrorInterceptor())
      ..setDebug(kDebugMode)
      ..timeout(kReleaseMode
          ? const Duration(minutes: 3)
          : const Duration(minutes: 1))
      ..build();
  }

  @lazySingleton
  NetworkImageConfigs networkImage({
    @Named('baseUrl') required Uri baseUrl,
    @Named('apiKey') required String apiKey,
  }) {
    return NetworkImageConfigs(
      baseUrl: Uri.parse('$baseUrl/files'),
      headers: () async {
        final accessToken = await GetIt.I<AuthRepository>().getAccessToken();
        final token =
            accessToken == null ? null : Token(accessToken, TokenType.bearer);
        return token == null
            ? {}
            : {
                'Authorization': token.build(),
                'Api-Key': apiKey,
              };
      },
    );
  }

  @singleton
  CacheOptions get cacheOptions {
    return CacheOptions(store: MemCacheStore());
  }

  @local
  @Order(0)
  @Named('baseUrl')
  Uri get localBaseUrl {
    return Uri(
      scheme: 'http',
      host: 'localhost',
      port: 3001,
    );
  }

  @dev
  @Order(0)
  @Named('baseUrl')
  Uri get devBaseUrl {
    return Uri(
      scheme: 'https',
      host: 'medical-tourism-api-dev-collabonet.pixelplatforms.com',
    );
  }

  @stage
  @Order(0)
  @Named('baseUrl')
  Uri get stageBaseUrl {
    return Uri(
      scheme: 'https',
      host: 'medical-tourism-api-stage-collabonet.pixelplatforms.com',
    );
  }

  @production
  @prod
  @Order(0)
  @Named('baseUrl')
  Uri get prodBaseUrl {
    return Uri(
      scheme: 'https',
      host: 'medical-tourism-api-prod-collabonet.pixelplatforms.com',
    );
  }

  @local
  @Order(0)
  @Named('apiKey')
  String get localApiKey =>
      '8edfe85af9e52e929397f90c5dfd6c9029de4855c0cff48963c27582be869de7';

  @dev
  @Order(0)
  @Named('apiKey')
  String get devApiKey =>
      '8edfe85af9e52e929397f90c5dfd6c9029de4855c0cff48963c27582be869de7';

  @stage
  @Order(0)
  @Named('apiKey')
  String get stageApiKey =>
      '8edfe85af9e52e929397f90c5dfd6c9029de4855c0cff48963c27582be869de7';

  @production
  @prod
  @Order(0)
  @Named('apiKey')
  String get prodApiKey =>
      '5cd9f031b4845ba78d688d01d3336e9d3eea2d3bce9f5c813a06d8533c3f1a3f';

  @dev
  @Order(0)
  @Named('fileUrl')
  String get devFileUrl =>
      'https://medical-tourism-api-dev-collabonet.pixelplatforms.com/files/';

  @stage
  @Order(0)
  @Named('fileUrl')
  String get stageFileUrl =>
      'https://medical-tourism-api-stage-collabonet.pixelplatforms.com/files/';

  @production
  @prod
  @Order(0)
  @Named('fileUrl')
  String get prodFileUrl =>
      'https://medical-tourism-api-prod-collabonet.pixelplatforms.com/files/';
}

class MerchantInterceptor extends Interceptor {}

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await GetIt.I<AuthRepository>().getAccessToken();
    if (token != null) {
      super.onRequest(
        options..headers.addAll({'Authorization': 'Bearer $token'}),
        handler,
      );
    } else {
      super.onRequest(options, handler);
    }
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final code = err.response?.statusCode ?? 0;
    // Forbidden
    if (code == 403) {
      GetIt.I<AppModel>().logOut();
      return;
    }
    // Token Expired
    else if (code == 401) {
      final requestOptions = err.requestOptions;
      logger.d('refreshing token');

      try {
        final credentials = await GetIt.I<AuthRepository>().refreshToken();
        final client = RestClient(requestOptions.baseUrl)
          ..setDebug(kDebugMode)
          ..timeout(kReleaseMode
              ? const Duration(minutes: 3)
              : const Duration(minutes: 1))
          ..build();

        final response = await client.dio.fetch(
          requestOptions
            ..headers.addAll(
              {'Authorization': 'Bearer ${credentials.accessToken}'},
            ),
        );
        handler.resolve(response);
        return;
      } catch (e) {
        if (e is DioException) {
          final code = err.response?.statusCode ?? 0;
          final isLoggedIn = await GetIt.I<AuthRepository>().isLoggedIn();
          if (isLoggedIn && (code == 401 || code == 403)) {
            GetIt.I<AppModel>().logOut();
          }
        }
      }
    }
    super.onError(err, handler);
  }
}

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:dio/dio.dart';

// Project imports:
import '../core_utils.dart';

abstract class ErrorResolver {
  String resolve(BuildContext context, Object? exception);
}

class DefaultErrorResolver implements ErrorResolver {
  @override
  @mustCallSuper
  String resolve(BuildContext context, Object? exception) {
    if (exception != null) logger.e(exception);

    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return context.l10n.errorTimeout;
        case DioExceptionType.connectionError:
          return context.l10n.errorConnection;
        case DioExceptionType.badCertificate:
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
          return context.l10n.errorUnknown;
        default:
          break;
      }

      final statusCode = exception.response?.statusCode;
      if (statusCode == null) return context.l10n.errorUnknown;
      return resolveWithStatusCode(context, statusCode);
    }

    return context.l10n.errorUnknown;
  }

  bool shouldRetry(Object? exception) {
    if (exception is DioException) {
      return exception.type == DioExceptionType.unknown &&
          exception.error != null &&
          exception.error is SocketException;
    }
    return false;
  }

  @mustCallSuper
  String resolveWithStatusCode(BuildContext context, int statusCode) {
    return context.l10n.errorUnknown;
  }
}

class BusinessErrorResolver implements ErrorResolver {
  @override
  @mustCallSuper
  String resolve(BuildContext context, Object? exception) {
    // TODO: implement resolve
    throw UnimplementedError();
  }
}

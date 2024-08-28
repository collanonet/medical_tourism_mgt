// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  RestClient(this.baseUrl);

  final String baseUrl;
  bool _debug = false;
  final dio = Dio();
  Map<String, String> headers = {};

  RestClient timeout(Duration timeout) {
    dio.options
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    return this;
  }

  RestClient addIntercepter(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
    return this;
  }

  RestClient setDebug(bool debug) {
    _debug = debug;
    return this;
  }

  RestClient build() {
    dio.options.headers.addAll(headers);
    if (_debug) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    }
    return this;
  }

  void close() {
    dio.close();
  }
}

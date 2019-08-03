import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHttp {
  static final DioHttp _instance = DioHttp._constructor();
  Dio _dioClient;

  DioHttp._constructor() {
    _dioClient = Dio(
      BaseOptions(
        baseUrl: DotEnv().env['APP_URL'],
      ),
    );

    setDefaultInterceptors();
  }

  _setInterceptors(InterceptorsWrapper interceptors) {
    _dioClient.interceptors.clear();
    _dioClient.interceptors.add(interceptors);
  }

  setTokenToAuthHeader({@required String token}) {
    _setInterceptors(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          options.headers = {HttpHeaders.authorizationHeader: 'Bearer $token'};
          return options;
        },
        onResponse: _defaultOnResponse,
        onError: _defaultOnError,
      ),
    );
  }

  setDefaultInterceptors() {
    _setInterceptors(
      InterceptorsWrapper(
        onRequest: _defaultOnRequest,
        onResponse: _defaultOnResponse,
        onError: _defaultOnError,
      ),
    );
  }

  _defaultOnRequest(RequestOptions options) {
    return options;
  }

  _defaultOnResponse(Response response) {
    return response;
  }

  _defaultOnError(DioError e) {
    return e;
  }

  factory DioHttp() => _instance;

  Dio get ins => _dioClient;
}

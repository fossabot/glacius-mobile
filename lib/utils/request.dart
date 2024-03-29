import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:glacius_mobile/exceptions/http_error_exception.dart';
import 'package:glacius_mobile/models/models.dart';

class Request {
  static final Request _instance = Request._constructor();
  Dio client;

  Request._constructor() {
    this.client = Dio(
      BaseOptions(
        baseUrl: DotEnv().env['APP_URL'],
        connectTimeout: 5 * 1000,
        headers: {'X-REQUEST-FROM': 'mobile'},
      ),
    );

    _addLogInterceptors();
    _addErrorFormattingInterceptors();
  }

  factory Request() => _instance;

  setInterceptors(InterceptorsWrapper interceptors) {
    client.interceptors.clear();
    client.interceptors.add(interceptors);
    _addLogInterceptors();
    _addErrorFormattingInterceptors();
  }

  setTokenToAuthHeader({@required String token}) {
    setInterceptors(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          options.headers.putIfAbsent(
            HttpHeaders.authorizationHeader,
            () => 'Bearer $token',
          );
          return options;
        },
      ),
    );
  }

  removeTokenFromAuthHeader() {
    setInterceptors(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          options.headers.remove(HttpHeaders.authorizationHeader);
          return options;
        },
      ),
    );
  }

  _addLogInterceptors({Interceptor logInterceptor}) {
    if (DotEnv().env['REQUEST_LOG'].toLowerCase() != 'true') {
      return;
    }

    if (logInterceptor != null) {
      client.interceptors.add(logInterceptor);
    } else {
      client.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  _addErrorFormattingInterceptors({Interceptor errorFormattingInterceptor}) {
    client.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error) {
          Map<String, dynamic> response;
          GeneralError generalError;
          if ((response = error.response?.data) != null) {
            generalError = GeneralError.fromJson(response);
          } else {
            generalError = GeneralError(
              message: error.toString(),
              statusCode: 400,
            );
          }

          return HttpErrorException(generalError.message, generalError);
        },
      ),
    );
  }
}

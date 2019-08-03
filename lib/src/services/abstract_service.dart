import 'package:dio/dio.dart';

abstract class AbstractService {
  Future processResponse(Response response) {
    return Future.value(response.data);
  }

  Future handleError(DioError error) {
    return Future.error(error.response.data);
  }
}

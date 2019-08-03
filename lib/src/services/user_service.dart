import 'package:flutter/foundation.dart';
import 'package:glacius_mobile/src/plugins/dio_http.dart';

import 'abstract_service.dart';

class UserService extends AbstractService {
  static final UserService _instance = new UserService._constructor();

  UserService._constructor();

  factory UserService() => _instance;

  Future login({@required String email, @required String password}) async {
    try {
      var res = await DioHttp()
          .ins
          .post('/user/login', data: {'email': email, 'password': password});

      return super.processResponse(res);
    } catch (error) {
      return super.handleError(error);
    }
  }

  Future getMe() async {
    try {
      var res = await DioHttp().ins.get(
            '/user/me',
          );

      return super.processResponse(res);
    } catch (error) {
      return super.handleError(error);
    }
  }
}

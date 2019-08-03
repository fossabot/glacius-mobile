import 'package:flutter/foundation.dart';
import 'package:glacius_mobile/src/plugins/dio_http.dart';
import 'package:glacius_mobile/src/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPlugin {
  static final AuthPlugin _instance = new AuthPlugin._constructor();

  AuthPlugin._constructor();

  factory AuthPlugin() => _instance;

  String _token;
  Map _cacheUser;

  Future storeToken({@required token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    DioHttp().setTokenToAuthHeader(token: token);
    _token = token;
    await loadUser();
    return Future.value();
  }

  Future getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    if (token != null) {
      DioHttp().setTokenToAuthHeader(token: token);
      _token = token;
      await loadUser();
    }
    return Future.value();
  }

  Future loadUser() async {
    if (_token != null) {
      _cacheUser = await UserService().getMe();
      return Future.value(_cacheUser);
    }

    return Future.error('Unauthenticated');
  }

  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    DioHttp().setDefaultInterceptors();
    _token = null;
    _cacheUser = null;
    return Future.value();
  }

  bool get isLoggedIn => _token != null;

  Map get user => _cacheUser;
}

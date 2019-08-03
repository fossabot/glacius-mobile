import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum LoginResult { None, LoginSuccess, LoginFailure }

class LoginState implements Cloneable<LoginState> {
  LoginResult loginResult;
  TextEditingController emailEditController;
  TextEditingController passwordEditController;
  String errorMsg;

  @override
  LoginState clone() {
    return LoginState()
    ..loginResult = loginResult
      ..emailEditController = emailEditController
      ..passwordEditController = passwordEditController
      ..errorMsg = errorMsg;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.loginResult = LoginResult.None;
  state.emailEditController = new TextEditingController(text: DotEnv().env['DEFAULT_EMAIL']);
  state.passwordEditController = new TextEditingController(text: DotEnv().env['DEFAULT_PASS']);
  return state;
}

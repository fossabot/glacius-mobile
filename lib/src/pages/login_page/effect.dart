import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:glacius_mobile/src/plugins/auth_plugin.dart';
import 'package:glacius_mobile/src/services/user_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.onLogin: _onLogin,
  });
}

void _onLogin(Action action, Context<LoginState> ctx) async {
  try {
    (action.payload as ProgressDialog).show();
    String token = await UserService()
        .login(
            email: ctx.state.emailEditController.text,
            password: ctx.state.passwordEditController.text)
        .then((res) => res['token']);

    ctx.dispatch(LoginActionCreator.onLoginSuccess());
    await AuthPlugin().storeToken(token: token);
    (action.payload as ProgressDialog).hide();
    await Navigator.of(ctx.context).pushReplacementNamed('/home');
  } catch (err) {
    String errMsg = err is Map ? err['msg'] : err.toString();
    ctx.dispatch(LoginActionCreator.onLoginFailure(errMsg));
    (action.payload as ProgressDialog).hide();
  }
}

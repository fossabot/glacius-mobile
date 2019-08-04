import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.onLoginFailure: _onLoginFailure,
      LoginAction.onLoginSuccess: _onLoginSuccess,
      LoginAction.onHidePasswordField: onHidePasswordField,
    },
  );
}

LoginState _onLoginFailure(LoginState state, Action action) {
  LoginState newState = initState(null);
  newState.loginResult = LoginResult.LoginFailure;
  newState.errorMsg = action.payload;
  return newState;
}

LoginState _onLoginSuccess(LoginState state, Action action) {
  LoginState newState = state.clone();
  newState.loginResult = LoginResult.LoginSuccess;
  return newState;
}

LoginState onHidePasswordField(LoginState state, Action action) {
  LoginState newState = state.clone();
  newState.hidePasswordField = action.payload;
  return newState;
}

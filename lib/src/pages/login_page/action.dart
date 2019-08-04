import 'package:fish_redux/fish_redux.dart';

enum LoginAction {
  onLogin,
  onLoginSuccess,
  onLoginFailure,
  onHidePasswordField,
}

class LoginActionCreator {
  static Action onLogin() {
    return Action(LoginAction.onLogin);
  }

  static Action onLoginSuccess() {
    return Action(LoginAction.onLoginSuccess);
  }

  static Action onLoginFailure(String errMsg) {
    return Action(LoginAction.onLoginFailure, payload: errMsg);
  }

  static Action onHidePasswordField(bool shouldHide) {
    return Action(LoginAction.onHidePasswordField, payload: shouldHide);
  }
}

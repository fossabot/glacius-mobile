import 'package:fish_redux/fish_redux.dart';
import 'package:progress_dialog/progress_dialog.dart';

enum LoginAction {
  onLogin,
  onLoginSuccess,
  onLoginFailure,
}

class LoginActionCreator {
  static Action onLogin(ProgressDialog progressDialog) {
    return Action(LoginAction.onLogin, payload: progressDialog);
  }

  static Action onLoginSuccess() {
    return Action(LoginAction.onLoginSuccess);
  }

  static Action onLoginFailure(String errMsg) {
    return Action(LoginAction.onLoginFailure, payload: errMsg);
  }
}

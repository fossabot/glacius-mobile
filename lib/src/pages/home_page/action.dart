import 'package:fish_redux/fish_redux.dart';

enum HomeAction { action, onLogout }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onLogout() {
    return Action(HomeAction.onLogout);
  }
}

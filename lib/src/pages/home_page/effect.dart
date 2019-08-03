import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:glacius_mobile/src/plugins/auth_plugin.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    HomeAction.onLogout: _onLogout,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _onLogout(Action action, Context<HomeState> ctx) async {
  await AuthPlugin().logout();
  await Navigator.of(ctx.context).pushReplacementNamed('/login');
}

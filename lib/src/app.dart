import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:glacius_mobile/src/plugins/auth_plugin.dart';
import 'package:glacius_mobile/src/routes.dart';

Widget createApp() {
  AbstractRoutes routes = buildRoutes();

  return MaterialApp(
    title: 'Glacius',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AuthPlugin().isLoggedIn
        ? routes.buildPage('/home', null)
        : routes.buildPage('/login', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

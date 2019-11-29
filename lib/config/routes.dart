import 'package:flutter/material.dart';
import 'package:glacius_mobile/app_init.dart';
import 'package:glacius_mobile/views/layout/layout.dart';
import 'package:glacius_mobile/views/setting/about/about.dart';
import 'package:glacius_mobile/views/setting/change_password/change_password_page_builder.dart';
import 'package:glacius_mobile/views/setting/setting.dart';

class Routes {
  static PageRouteBuilder generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Routes.configureRoutes(
          settings.arguments,
        )[settings.name](context);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (settings.name == '/' || settings.name == '/main') {
          return FadeTransition(opacity: animation, child: child);
        }

        return SlideTransition(
          transformHitTests: false,
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: new SlideTransition(
            position: new Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-1.0, 0.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      },
      transitionDuration: settings.name == '/' || settings.name == '/main'
          ? Duration(milliseconds: 500)
          : Duration(milliseconds: 200),
    );
  }

  static Map<String, WidgetBuilder> configureRoutes(Map args) {
    return {
      '/': (context) => AppInit(),
      '/main': (context) => LayoutPageBuilder(),
      '/settings': (context) => SettingPage(args: args),
      '/settings/account/change_password': (context) =>
          ChangePasswordPageBuilder(),
      '/settings/about': (context) => AboutPage(),
    };
  }
}
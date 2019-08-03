import 'package:fish_redux/fish_redux.dart';
import 'package:glacius_mobile/src/pages/home_page/page.dart';
import 'package:glacius_mobile/src/pages/login_page/page.dart';

buildRoutes() {
  return PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      '/login': LoginPage(),
      '/home': HomePage(),
    },
  );
}

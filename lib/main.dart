import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:glacius_mobile/bloc/auth/auth.dart';
import 'package:glacius_mobile/bloc/bloc.dart';
import 'package:glacius_mobile/config/config.dart';
import 'package:glacius_mobile/repositories/repositories.dart';
import 'package:glacius_mobile/utils/utils.dart';

import 'bloc/shop/shop_bloc.dart';

Future main() async {
  await DotEnv().load('.env');
  await Application.loadPackageInfo();
  BlocSupervisor.delegate = LogBlocDelegate();

  runApp(
    MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            builder: (context) => UserRepository(),
          ),
          RepositoryProvider<ShopRepository>(
            builder: (context) => ShopRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<ShopBloc>(
              builder: (context) {
                return ShopBloc(
                  shopRepository: RepositoryProvider.of<ShopRepository>(
                    context,
                  ),
                );
              },
            ),
            BlocProvider<AuthBloc>(
              builder: (context) {
                return AuthBloc(
                  shopBloc: BlocProvider.of<ShopBloc>(context),
                  userRepository: RepositoryProvider.of<UserRepository>(
                    context,
                  ),
                )..add(AppStarted());
              },
            ),
          ],
          child: App(),
        )),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glacius',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0175c2),
        accentColor: Color(0xFF13B9FD),
        errorColor: Color(0xfff86c6b),
        indicatorColor: Color(0xff20a8d8),
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

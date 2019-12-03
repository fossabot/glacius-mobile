import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glacius_mobile/bloc/auth/auth.dart';
import 'package:glacius_mobile/views/layout/layout.dart';
import 'bloc/bloc.dart';

class LayoutPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: BlocProvider<LayoutBloc>(
        create: (context) => LayoutBloc(),
        child: LayoutPage(),
      ),
    );
  }
}

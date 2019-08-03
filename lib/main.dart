import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:glacius_mobile/src/plugins/auth_plugin.dart';
import 'src/app.dart';

void main() async {
  await DotEnv().load('.env');
  await AuthPlugin().getToken();
  runApp(createApp());
}

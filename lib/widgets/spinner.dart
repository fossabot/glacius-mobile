import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner {
  static Widget withScaffold(context) {
    return Scaffold(
      body: Spinner.configured(context),
    );
  }

  static Widget configured(context) {
    return SpinKitRing(
      color: Theme.of(context).indicatorColor,
      lineWidth: 4.0,
      size: 35.0,
    );
  }
}

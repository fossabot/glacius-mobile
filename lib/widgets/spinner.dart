import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner {
  static Widget withScaffold(context) {
    return Scaffold(
      body: Spinner.configured(context),
    );
  }

  static Widget configured(
    context, {
    double size = 35.0,
    double lineWidth = 4.0,
  }) {
    return SpinKitRing(
      color: Theme.of(context).indicatorColor,
      lineWidth: lineWidth,
      size: size,
    );
  }
}

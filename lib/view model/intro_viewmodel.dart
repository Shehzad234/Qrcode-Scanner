import 'dart:async';

import 'package:qrcode_scanner/view/landing_view.dart';
import 'package:flutter/material.dart';

class IntroViewModel {
  static void moveToHome(context) {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LandingView.path, (route) => false);
    });
  }
}

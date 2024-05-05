import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppConstants {
  static void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
  static bool onboarding =false;
  static bool lang =true;

  static void navigateToAndFinish(context, widget) =>
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
          (route) => false);
}

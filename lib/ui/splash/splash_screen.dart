import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation/ui/home/home_screen.dart';
import 'package:graduation/ui/onboarding/onboarding_screen.dart';

import '../../layout/layout_screen.dart';
import '../../shared/constants/app_constants.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        AppConstants.navigateToAndFinish(
            context,
            AppConstants.onboarding
                ? FirebaseAuth.instance.currentUser != null
                    ? LayoutScreen()
                    : LoginScreen()
                : OnboardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo/Full.png",
              height: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}

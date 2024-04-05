import 'package:flutter/material.dart';
import 'package:graduation/layout/layout_screen.dart';
import 'package:graduation/ui/home/home_screen.dart';
import 'package:graduation/ui/login/login_screen.dart';

import 'ui/onboarding/onboarding_screen.dart';
import 'ui/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'museum',
      home: LayoutScreen(),
    );
  }
}

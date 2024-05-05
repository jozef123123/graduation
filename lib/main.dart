import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/layout/cubit/cubit.dart';
import 'package:graduation/shared/Bloc_Observer.dart';
import 'package:graduation/shared/constants/app_constants.dart';
import 'package:graduation/shared/network/local/casheHelper.dart';
import 'firebase_options.dart';
import 'ui/splash/splash_screen.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await cashHelper.Init();


      AppConstants.onboarding = cashHelper.getData(key: 'onboard') ?? false;
      print(AppConstants.onboarding);
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(FirebaseAuth.instance.currentUser?.uid)..Get_Artifact(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'museum',
        home: SplashScreen(),
      ),
    );
  }
}

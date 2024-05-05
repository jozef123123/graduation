import 'package:flutter/material.dart';
import 'package:graduation/ui/home/home_screen.dart';
import 'package:graduation/ui/login/login_screen.dart';

import '../../shared/constants/app_constants.dart';
import 'package:graduation/shared/network/local/casheHelper.dart';
class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> photoContant = [
    "assets/images/onphoto/Haram.png",
    "assets/images/onphoto/fr3on.png",
    "assets/images/onphoto/scanPhoto.png",
  ];

  List<String> textContant = [
    'Welcome to civilization',
    'History with an eye to the future',
    ' Pharos says Hi ',
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo/logoPhoto.png",
                    width: 60.0,
                  ),
                  SizedBox(width: 5.0),
                  Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Image.asset(
                        "assets/images/logo/logoText.png",
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              Container(
                height: 500.0,
                child: PageView.builder(

                  itemCount: photoContant.length,
                  itemBuilder: (_, index) => Column(
                    children: [
                      Image.asset(
                        photoContant[i],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        textContant[i],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPageChanged: (value) {
                    setState(() {
                      i = value;
                    });
                  },
                ),
              ),
              Container(
                height: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    photoContant.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: AnimatedContainer(
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 100),
                        width: index == i ? 50 : 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 214, 0, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {    setState(() {
                cashHelper.SavaData(key: 'onboard', value: true);
              });
              AppConstants.navigateToAndFinish(context, LoginScreen());
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if( i < 2) {
                    i++;
                  }else{
                    setState(() {
                      cashHelper.SavaData(key: 'onboard', value: true);
                    });
                    AppConstants.navigateToAndFinish(context, LoginScreen());
                  }
                });
              },
              icon: CircleAvatar(
                child: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromRGBO(255, 214, 0, 1),
                radius: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

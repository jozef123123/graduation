import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/shared/models/artifact_model/artifact_model.dart';
import 'package:graduation/ui/favorite/favorite_screen.dart';
import 'package:graduation/ui/home/home_screen.dart';
import 'package:graduation/ui/profile/profile_screen.dart';
import 'package:graduation/ui/scan/scan_screen.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  bool theme = true;
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ScanScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AppCubit.get(context).getUserData(FirebaseAuth.instance.currentUser?.uid);
    // AppCubit.get(context).Get_Artifact();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2.0,
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Artifact_Model art = Artifact_Model(
                        title_ar: ' لكاهن',
                        title_en: ' Amun',
                        id: '',
                        description_en:
                            'This statue depicts Nesmenw son of Keb if Ha Khonsu. He is dressed in Egyptian mantle, tucked on the chest with halter on the shoulder. Nesmenw was a priest of Amun in Karanak. The statue was dedicated by his parents, because of his premature death.Ptolemaic Period: 300 BC./ Karnak Cachette/ Black granite',
                        description_ar:
                            'يصور هذا التمثال نسمنو ابن كب إذا خونسو. يرتدي عباءة مصرية مثبتة على الصدر بحزام على الكتف. كان نسمنو كاهنًا لآمون في الكرنك. تم تكريس التمثال من قبل والديه، بسبب وفاته المبكرة.الفترة البطلمية: 300 قبل الميلاد./ كشف الكرنك/ الجرانيت الأسود',
                        image:
                            'https://mediaaws.almasryalyoum.com/news/verylarge/2021/11/26/1680277_0.jpg');
                    AppCubit.get(context).Upload_Artifact(art);
                  },
                  child: Image.asset(
                    'assets/images/logo/logoPhoto.png',
                    height: 45.0,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(
                      'assets/images/logo/logoText.png',
                      height: 40.0,
                    ),
                  ],
                ),
              ],
            ),
            titleSpacing: 20.0,
          ),
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            elevation: 20.0,
            selectedItemColor: Colors.amber,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: "Scan",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}

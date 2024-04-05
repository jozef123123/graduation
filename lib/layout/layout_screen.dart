import 'package:flutter/material.dart';
import 'package:graduation/ui/favorite/favorite_screen.dart';
import 'package:graduation/ui/home/home_screen.dart';
import 'package:graduation/ui/profile/profile_screen.dart';
import 'package:graduation/ui/scan/scan_screen.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo/logoPhoto.png',
              height: 45.0,
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
        onTap: (index){
          setState(() {
            currentIndex = index ;
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
  }
}

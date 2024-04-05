import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo/Full.png',
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

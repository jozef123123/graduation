import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/back/_f0adba1b-392d-4217-9ad6-a89ee8212d5e.jpeg',
                  fit: BoxFit.cover,
                  width: 380,
                  opacity: const AlwaysStoppedAnimation(.5),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 50
                ),
                child: CircleAvatar(
                  radius: 45,
                 backgroundImage: AssetImage('assets/images/back/_f0adba1b-392d-4217-9ad6-a89ee8212d5e.jpeg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

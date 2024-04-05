import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          height: 200,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/back/_f0adba1b-392d-4217-9ad6-a89ee8212d5e.jpeg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                  opacity: const AlwaysStoppedAnimation(.5),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 50),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                        'assets/images/back/_f0adba1b-392d-4217-9ad6-a89ee8212d5e.jpeg'),
                  ),
                ),
              ),
            ],
          ),
        ),
        profile_widget(
            onPressed: () {}, text1: 'user name :', text2: 'yousef yehia'),
        profile_widget(
            onPressed: () {},
            text1: 'Email :',
            text2: 'yousef yehia202@gmail.com ',
            ifEdit: false),
        profile_widget(
            onPressed: () {}, text1: 'Change Language :', text2: 'En'),
        profile_widget(
            onPressed: () {}, text1: 'Phone Number :', text2: '+01002103934'),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,),style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget profile_widget({text1, text2, onPressed, ifEdit = true}) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Text(
                    text1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                 Expanded(
                   child:   TextFormField(
                     maxLines: 1,
                     minLines: null,
                     decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(12),
                             borderSide:
                             BorderSide(color: Colors.transparent)),
                         errorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(12),
                             borderSide: BorderSide(color: Colors.red)),
                         disabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(12),
                             borderSide:
                             BorderSide(color: Colors.transparent)),
                         hintText: '$text2',
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(

                               color:  Colors.transparent),),
                       ),
                   ),
                 ),

                  ifEdit
                      ? IconButton(onPressed: onPressed, icon: Icon(Icons.edit))
                      : SizedBox()
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.amber,
          )
        ],
      );
}

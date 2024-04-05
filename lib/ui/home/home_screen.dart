import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../home_detailes/home_detailes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.amber,
                height: 4,
                width: 150,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.amber,
                    height: 180,
                    width: 4,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 25.0),
                child: Text(
                  'Welcome in Kafr \n Elsheikh \n Museum',
                  style: TextStyle(
                    fontFamily: 'CinzelDecorative',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.amber,
                height: 180,
                width: 4,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.amber,
                height: 4,
                width: 150,
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              height: 2,
              width: 200,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'Proposals :',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailes_Screen(),));
                  },
                  child: home_wiget(
                      title: 'Tutankhamun',
                      image:
                          'assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',
                      description:
                          'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',
                      onPressed: () {
                        setState(() {
                          fav = !fav;
                        });
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget home_wiget({image, title, description, onPressed}) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.black54,
              offset: Offset(0,3)
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                '$image',
                width: 110,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      fontFamily: 'CinzelDecorative',
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$description',
                    style: TextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.favorite,
                  color: fav ? Colors.red : Colors.grey,
                )),
          ],
        ),
      );
}

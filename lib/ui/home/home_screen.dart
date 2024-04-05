import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool fav = false ;
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',
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
                        'Tutankhamun',
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
                        'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',
                        style: TextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        fav = !fav ;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: fav ? Colors.red : Colors.grey,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',
                  width: 110,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tutankhamun',
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
                        'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',
                        style: TextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        fav = !fav ;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: fav ? Colors.red : Colors.grey,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',
                  width: 110,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tutankhamun',
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
                        'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',
                        style: TextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        fav = !fav ;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: fav ? Colors.red : Colors.grey,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

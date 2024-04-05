import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailes_Screen extends StatefulWidget {
   HomeDetailes_Screen({super.key});

  @override
  State<HomeDetailes_Screen> createState() => _HomeDetailes_ScreenState();
}

class _HomeDetailes_ScreenState extends State<HomeDetailes_Screen> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: SingleChildScrollView(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',height: 190,)),


                  Column(
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8,),
                          Text(
                            'Languge:  ',
                            style: TextStyle(

                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          DropdownButton<String>(iconEnabledColor:  Colors.amber,
                            value: _selectedLanguage,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLanguage = newValue!;
                                // Here you can add logic to change the language in your app
                              });
                            },
                            items: <String>['en', 'ar'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value == 'en' ? 'En' : 'Ar'),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Image.network('https://img.freepik.com/premium-vector/voice-message-sign-audio-chat-element-with-play-icon-sound-wave_254622-603.jpg',height: 60,width: MediaQuery.sizeOf(context).width/2.5,fit: BoxFit.contain,),
                      Row(
                        children: [SizedBox(width: 8,),
                          Container(
                            width: MediaQuery.sizeOf(context).width/2.6,
                            child: Text(
                              'Tutankhamuneeeeeeee',
                              style: TextStyle(
                                fontFamily: 'CinzelDecorative',
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.amber,
            ),
            SizedBox(height: 10,),
            Text(
              'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',

             textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CinzelDecorative',
                fontSize: 17.0,

                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

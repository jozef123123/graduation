import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation/ui/home_detailes/home_detailes.dart';

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
            // Image.asset(
            //   'assets/images/logo/Full.png',
            //   width: 150,
            // ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorite antiques',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailes_Screen(),));
                    },
                    child: favorite_widget(
                        title: 'Tutankhamun',
                        image:
                        'assets/images/back/_17a314da-7b02-4b7a-99c9-48582d932f4b.jpeg',
                        description:
                        'Tutankhamun is one of the greatest kings that ruled Egypt, \n he was the most powerful of them, and he is the owner of the most expensive mask discovered so far.',
                        onPressed: () {

                        }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget favorite_widget({image, title, description, onPressed}) => Container(
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
              color: Colors.red,
            )),
      ],
    ),
  );

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/shared/constants/app_constants.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../home_detailes/home_detailes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: AppConstants.lang ?TextDirection.ltr :TextDirection.rtl,
          child: Padding(
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
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 25.0),
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
                    itemCount: cubit.artifacts.length >0? 2:0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeDetailes_Screen(
                                  artifact_model: cubit.artifacts[index],
                                ),
                              ));
                        },
                        child: home_wiget(
                            title: AppConstants.lang
                                ? '${cubit.artifacts[index].title_en}'
                                : '${cubit.artifacts[index].title_ar}',
                            image:
                            '${cubit.artifacts[index].image}',
                            description: AppConstants.lang
                                ? '${cubit.artifacts[index].description_en}'
                                : '${cubit.artifacts[index].description_ar}',id: cubit.artifacts[index].id,
                            onPressed: () {
                              if(!AppCubit.get(context).user_model!.favorites!.contains(cubit.artifacts[index].id)){
                                AppCubit.get(context).make_favorite(cubit.artifacts[index].id);
                              }else
                              {
                                AppCubit.get(context).remove_favorite(cubit.artifacts[index].id!);
                              }


                            }),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget home_wiget({image, title, description, onPressed,id}) => Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
                blurRadius: 1, color: Colors.black54, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppConstants.lang ? BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ):BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                '$image',
                width: 110,
                height: 120,
                fit: BoxFit.fill
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  AppCubit.get(context).user_model!.favorites!.contains(id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      AppCubit.get(context).user_model!.favorites!.contains(id)
                          ? Color(0xffE81515)
                          : Colors.black,
                )),
          ],
        ),
      );
}

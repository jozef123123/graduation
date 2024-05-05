import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/layout/cubit/cubit.dart';
import 'package:graduation/layout/cubit/state.dart';
import 'package:graduation/ui/home_detailes/home_detailes.dart';

import '../../shared/constants/app_constants.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return  Directionality(
      textDirection: AppConstants.lang ?TextDirection.ltr :TextDirection.rtl,
      child: Padding(
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
                  itemCount: cubit.favorite_list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailes_Screen(artifact_model:cubit.artifacts[index] ),));
                      },
                      child: home_wiget(
                          title: AppConstants.lang
                              ? '${cubit.favorite_list[index].title_en}'
                              : '${cubit.favorite_list[index].title_ar}',
                          image:
                          '${cubit.favorite_list[index].image}',
                          description: AppConstants.lang
                              ? '${cubit.favorite_list[index].description_en}'
                              : '${cubit.favorite_list[index].description_ar}',id: cubit.favorite_list[index].id,
                          onPressed: () {
                            if(!AppCubit.get(context).user_model!.favorites!.contains(cubit.favorite_list[index].id)){
                              AppCubit.get(context).make_favorite(cubit.favorite_list[index].id);
                            }else
                            {
                              AppCubit.get(context).remove_favorite(cubit.favorite_list[index].id!);
                            }


                          }),
                    );
                  },
                ),
              )
            ],
          ),
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
            height: 130,
            width: 110,  fit: BoxFit.fill
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),            child: Column(
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

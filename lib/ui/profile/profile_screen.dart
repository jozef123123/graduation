import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/shared/constants/app_constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneControler = TextEditingController();
  File? _selectedImage; // State variable to hold the image file

  void _pickAndUpdateImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Update the local image file
      });

      // Optionally upload and update the profile immediately
      AppCubit.get(context).updateProfileImage(_selectedImage!);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is UpdateSucssesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 400),
              content: Text(
                'Succses ...',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        nameController.text = cubit.user_model?.name ?? '';
        phoneControler.text = cubit.user_model?.phone ?? '';

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
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
                        child: GestureDetector(
                          onTap: _pickAndUpdateImage,
                          child: CircleAvatar(
                            radius: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _selectedImage != null
                                  ? Image.file(
                                      _selectedImage!) // Display the newly picked image from file
                                  : Image.network('${cubit.user_model?.image}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            profile_widget(
                controller: nameController,
                onPressed: () {
                  cubit.UpdateUser(name: nameController.text);
                },
                text1: 'User Name:',
                text2: '${cubit.user_model?.name}'),
            profile_widget(
                enabled: false, // Disable editing
                text1: 'Email:',
                text2: '${cubit.user_model?.email}'),
            profile_widget(
                ontap: () {
                  cubit.ChangeLang();
                },
                enabled: false,
                onPressed: () {},
                text1: 'Change Language:',
                text2: AppConstants.lang ? 'En' : 'Ar'),
            profile_widget(
                controller: phoneControler,
                onPressed: () {
                  cubit.UpdateUser(phone: phoneControler.text);
                },
                text1: 'Phone Number:',
                text2: '${cubit.user_model?.phone}'),
            SliverToBoxAdapter(
              child: SizedBox(height: MediaQuery.of(context).size.height / 6),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.SignOut(context);
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget profile_widget(
          {TextEditingController? controller,
          bool enabled = true,
          required String text1,
          required String text2,
          void Function()? onPressed,
          ontap}) =>
      SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Text(
                      text1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: enabled ? () {} : ontap,
                        child: TextFormField(
                          controller: controller,
                          enabled: enabled,
                          maxLines: 1,
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
                            hintText: text2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (enabled)
                      IconButton(onPressed: onPressed, icon: Icon(Icons.edit))
                    else
                      SizedBox()
                  ],
                ),
              ),
            ),
            Divider(color: Colors.amber),
          ],
        ),
      );
}

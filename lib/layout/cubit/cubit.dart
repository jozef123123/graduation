import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/layout/cubit/state.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../shared/constants/app_constants.dart';
import '../../shared/models/artifact_model/artifact_model.dart';
import '../../shared/models/user/user_model.dart';
import '../../ui/login/login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIniteal());

  static AppCubit get(context) => BlocProvider.of(context);
  void ChangeLang() {
    AppConstants.lang = !AppConstants.lang;
    emit(changeLangState());
  }  void ChangeLangEmit() {

    emit(changeLangState());
  }

  Future<void> signUpAndStoreUserData({
    required String email,
    required String password,
    required String name,
    required String phone,
    required context,
  }) async {
    emit(SignUpLodingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;
      print(uid);

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'image': 'https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg',
        'name': name,
        'phone': phone,
        'favorites': [],
        'email': email,
        'password': password,
        'id': uid,
      }).then((value) {
        emit(GetUserDataLodingState());
        getUserData(FirebaseAuth.instance.currentUser?.uid);
        emit(SignUpSucssesState());
      });

      print('User signed up and data stored successfully');
    } catch (e) {
      emit(SignUpErrorState());
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          // Show a Snackbar when the email is already in use

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'email-already-in-use',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'too-many-request',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'weak-password') {
          // Show a Snackbar when the password is too weak
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'weak-password',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-up: ${e.message}');
        }
      } else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                textAlign: TextAlign.center,
                '5eu08qdd',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );
      } else {
        // Handle other errors
        print('Error during user sign-up: $e');
      }
      throw e;
    }
  }

  Future<void> signIN({
    required String email,
    required String password,
    required context,
  }) async {
    emit(SignINLodingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(GetUserDataLodingState());
        getUserData(value.user?.uid);
        emit(SignINSucssesState());
      });

      print('User signed up and data stored successfully');
    } catch (e) {
      emit(SignINErrorState());
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'user-not-found') {
          // Show a Snackbar when email is not found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'المستخدم غير موجود',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'wrong-password') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'الباسورد خطا',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  textAlign: TextAlign.center,
                  'عدد معاملات كثيره يرجا الانتظار قليلا',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-in: ${e.message}');
        }
      } else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                textAlign: TextAlign.center,
                'يرجا مراجعه الاتصال الخاص بك',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );
      } else {
        // Handle other errors
        print('Error during user sign-in: $e');
      }
    }
  }

  void SignOut(context) {
    FirebaseAuth.instance.signOut().then((value) {
      print(FirebaseAuth.instance.currentUser);
      AppConstants.navigateToAndFinish(context, LoginScreen());
      emit(SignOutSucssesState());
    }).catchError((error) {
      emit(SignOutErrorState());
    });
  }

  User_Model? user_model;

  void getUserData(uid) {
    print(FirebaseAuth.instance.currentUser?.uid);
    emit(GetUserDataLodingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print(value.data());
      user_model = User_Model.fromJson(value.data()!);
      print(user_model?.name);
      emit(GetUserDataSucssesState());
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }

  Future<void> updateProfileImage(File imageFile) async {
    emit(UpdateLoadingState()); // Show loading indicator
    try {
      String filePath = 'profile_images/${DateTime.now().millisecondsSinceEpoch}_${FirebaseAuth.instance.currentUser!.uid}.jpg';
      final ref = FirebaseStorage.instance.ref().child(filePath);

      // Upload image to Firebase Storage
      final result = await ref.putFile(imageFile);
      final imageUrl = await result.ref.getDownloadURL();

      // Update Firestore with the new image URL
       UpdateUser(image: imageUrl);
    } catch (e) {
      print(e.toString());
      emit(UpdateErrorState());
    }
  }
  void UpdateUser({String? name,String? phone,String? image}) async {
    emit(UpdateLoadingState());
   await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({'name': name ?? user_model?.name,'phone': phone ?? user_model?.phone,'image': image ?? user_model?.image})
        .then((value) {
      emit(UpdateSucssesState());
      getUserData(FirebaseAuth.instance.currentUser?.uid);
    }).catchError((e) {
      print(e.toString());
      emit(UpdateErrorState());
    });
  }

  void Upload_Artifact(Artifact_Model artifact_model) async {
    emit(Upload_Artifact_LoadingState());
    FirebaseFirestore.instance
        .collection('Artifacts')
        .add(artifact_model.toJson())
        .then((value) {
      print(value.id);
      FirebaseFirestore.instance.collection('Artifacts').doc(value.id).update({
        'id': value.id,
      });
      emit(Upload_Artifact_SucssesState());
      Get_Artifact();
    }).catchError((e) {
      print(e.toString());
      emit(Upload_Artifact_ErrorState());
    });
  }

  List<Artifact_Model> artifacts = [];
  List<Artifact_Model> favorite_list = [];

  void Get_Artifact() async {
    emit(get_Artifact_LoadingState());

    artifacts.clear();
    favorite_list.clear();

    try {
      var snapshot = await FirebaseFirestore.instance.collection('Artifacts').get();
      for (var doc in snapshot.docs) {
        var artifact = Artifact_Model.fromJson(doc.data());
        artifacts.add(artifact);
        if (user_model?.favorites?.contains(doc.data()['id']) ?? false) {
          favorite_list.add(artifact);
        }
      }
      emit(get_Artifact_SucssesState());
    } catch (e) {
      print(e.toString());
      emit(get_Artifact_ErrorState());
    }
  }


  void make_favorite(id) {
    emit(makeFavoriteLoadingState());
    var userId =FirebaseAuth.instance.currentUser!.uid;
   var  favorites = user_model?.favorites??[];
    if (!favorites.contains(id)) {
      favorites.add(id);
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({
      'favorites':favorites
    })
        .then((value) {
          getUserData(userId);
          Get_Artifact();
      emit(makeFavoriteSucssesState());

    })
        .catchError((e) {
          print(e.toString());
          emit(makeFavoriteErrorState());
    });

  }
  void remove_favorite(String idToRemove) {
    emit(remove_FavoriteLoadingState());
    var favorites = user_model?.favorites ?? [];
    var userId = FirebaseAuth.instance.currentUser!.uid;

    // Correctly remove the item with the specified id
    favorites.removeWhere((item) => item == idToRemove);

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({
      'favorites': favorites
    })
        .then((value) {
      getUserData(userId);
      Get_Artifact();
      emit(remove_FavoriteSucssesState());
    })
        .catchError((e) {
      print(e.toString());
      emit(remove_FavoriteErrorState());
    });
  }
  AudioPlayer audioPlayer = AudioPlayer();
  late String currentAudioUrl;

  Future<void> fetchAudioUrl(String text, String language) async {
    emit(AudioLoadingState());
    try {
      var response = await http.post(
          Uri.parse('https://youssifallam.pythonanywhere.com/api/v1/GTTS/text-to-speech/'),
          body: {'text': text, 'language': language}
      );

      if (response.statusCode == 201) {
        var data = json.decode(response.body);
        currentAudioUrl = data['URL'];
        emit(AudioSuccessState(currentAudioUrl));
      } else {
        emit(AudioErrorState());
      }
    } catch (e) {
      emit(AudioErrorState());
    }
  }

  void playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
    audioPlayer.onDurationChanged.listen((newDuration) {
      audioPlayer.onPositionChanged.listen((newPosition) {
        emit(AudioPlayingState(url, newDuration, newPosition));
      });
    });
  }

  void stopAudio() async {
    await audioPlayer.stop();
    emit(AudioStoppedState());
  }
  void resetAudio() async {
    await audioPlayer.stop();
    emit(changeLangState());
  }

}

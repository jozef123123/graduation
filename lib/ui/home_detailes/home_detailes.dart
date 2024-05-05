import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/layout/cubit/cubit.dart';
import 'package:graduation/layout/cubit/state.dart';
import 'package:graduation/shared/models/artifact_model/artifact_model.dart';

import '../../shared/constants/app_constants.dart';

class HomeDetailes_Screen extends StatefulWidget {
  HomeDetailes_Screen({super.key, required this.artifact_model});

  Artifact_Model artifact_model;

  @override
  State<HomeDetailes_Screen> createState() => _HomeDetailes_ScreenState();
}

class _HomeDetailes_ScreenState extends State<HomeDetailes_Screen> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AudioErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Failed to load audio")));
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
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
          body: Directionality(
            textDirection:
                AppConstants.lang ? TextDirection.ltr : TextDirection.rtl,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 190,
                  //   child: Row(
                  //     children: [
                  //       ClipRRect(
                  //           borderRadius: BorderRadius.circular(12),
                  //           child: Image.network(
                  //             '${widget.artifact_model.image}',
                  //             fit: BoxFit.fill,
                  //             height: 190,
                  //             width: MediaQuery.sizeOf(context).width / 2.3,
                  //           )),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               Text(
                  //                 AppConstants.lang
                  //                     ? 'Languge :  '
                  //                     : ' اللغة :   ',
                  //                 style: TextStyle(
                  //                   fontSize: 12.0,
                  //                   fontWeight: FontWeight.w600,
                  //                 ),
                  //               ),
                  //               DropdownButton<String>(
                  //                 iconEnabledColor: Colors.amber,
                  //                 value: _selectedLanguage,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedLanguage = newValue!;
                  //                     AppConstants.lang =
                  //                         newValue == 'en' ? true : false;
                  //                     // Here you can add logic to change the language in your app
                  //                   });
                  //                 },
                  //                 items:
                  //                     <String>['en', 'ar'].map((String value) {
                  //                   return DropdownMenuItem<String>(
                  //                     value: value,
                  //                     child: Text(value == 'en' ? 'En' : 'Ar'),
                  //                   );
                  //                 }).toList(),
                  //               ),
                  //             ],
                  //           ),
                  //           // Column(
                  //           //   children: [
                  //           //     // Your existing UI components
                  //           //     if ( state is AudioSuccessState)
                  //           //       SizedBox(
                  //           //         width:
                  //           //         MediaQuery.sizeOf(context).width / 2.1,
                  //           //         child: Row(
                  //           //           children: [
                  //           //             Expanded(
                  //           //               child: Slider(
                  //           //                 value: 30.0,
                  //           //                 min: 0,
                  //           //                 activeColor: Colors.amber,
                  //           //                 max: 30.0,
                  //           //                 onChanged: (value) {
                  //           //                   cubit.audioPlayer.seek(Duration(
                  //           //                       seconds: value.toInt()));
                  //           //                 },
                  //           //               ),
                  //           //             ),
                  //           //
                  //           //             InkWell(
                  //           //                 onTap: () {
                  //           //
                  //           //                     cubit.playAudio(
                  //           //                         state.audioUrl);
                  //           //
                  //           //                 },
                  //           //                 child:  Icon(
                  //           //                     Icons.play_circle_outline)),
                  //           //
                  //           //
                  //           //           ],
                  //           //         ),
                  //           //       ),
                  //           //     if (state is AudioPlayingState)
                  //           //       SizedBox(
                  //           //         width:
                  //           //             MediaQuery.sizeOf(context).width / 2.1,
                  //           //         child: Row(
                  //           //           children: [
                  //           //             Expanded(
                  //           //               child: Slider(
                  //           //                 value: state.position.inSeconds
                  //           //                     .toDouble(),
                  //           //                 min: 0,
                  //           //                 activeColor: Colors.amber,
                  //           //                 max: state.duration.inSeconds
                  //           //                     .toDouble(),
                  //           //                 onChanged: (value) {
                  //           //                   cubit.audioPlayer.seek(Duration(
                  //           //                       seconds: value.toInt()));
                  //           //                 },
                  //           //               ),
                  //           //             ),
                  //           //
                  //           //               InkWell(
                  //           //                   onTap: () {
                  //           //                     if (state is AudioStoppedState)
                  //           //                       cubit.playAudio(
                  //           //                           state.audioUrl);
                  //           //                     if (state is AudioPlayingState)
                  //           //                       cubit.stopAudio();
                  //           //                   },
                  //           //                   child:  state is AudioStoppedState?Icon(
                  //           //                   Icons.play_circle_outline):  Icon(
                  //           //                       Icons.pause_circle_outline)),
                  //           //
                  //           //
                  //           //           ],
                  //           //         ),
                  //           //       ),
                  //           //     GestureDetector(
                  //           //       onTap: () async {
                  //           //         print('object');
                  //           //         if (state is AudioPlayingState) {
                  //           //           cubit.stopAudio();
                  //           //         } else if (state is AudioSuccessState) {
                  //           //           cubit.playAudio(state.audioUrl);
                  //           //         } else if (state is get_Artifact_SucssesState || state is GetUserDataSucssesState ||
                  //           //             state is AudioStoppedState) {
                  //           //           String? description = AppConstants.lang
                  //           //               ? widget.artifact_model.description_en
                  //           //               : widget
                  //           //                   .artifact_model.description_ar;
                  //           //           cubit.fetchAudioUrl(
                  //           //               description!, _selectedLanguage);
                  //           //         }
                  //           //       },
                  //           //       child: state is AudioLoadingState
                  //           //           ? CircularProgressIndicator()
                  //           //           : state is AudioSuccessState
                  //           //               ? state is AudioPlayingState
                  //           //                   ? Container()
                  //           //                   : Container()
                  //           //               : state is AudioPlayingState
                  //           //                   ? Container()
                  //           //                   : SizedBox(
                  //           //         width:
                  //           //         MediaQuery.sizeOf(context).width / 2.1,
                  //           //         child: Row(
                  //           //           children: [
                  //           //             Expanded(
                  //           //               child: Slider(
                  //           //                 value: 30.0,
                  //           //                 min: 0,
                  //           //                 activeColor: Colors.amber,
                  //           //                 max: 30.0,
                  //           //                 onChanged: (value) {
                  //           //                   cubit.audioPlayer.seek(Duration(
                  //           //                       seconds: value.toInt()));
                  //           //                 },
                  //           //               ),
                  //           //             ),
                  //           //
                  //           //             Icon(
                  //           //                     Icons.play_circle_outline)
                  //           //
                  //           //
                  //           //           ],
                  //           //         ),
                  //           //       ),
                  //           //     ),
                  //           //   ],
                  //           // ),
                  //           if (state is AudioPlayingState) buildSlider(state, cubit),
                  //           if (state is AudioSuccessState || state is AudioStoppedState || state is AppIniteal|| state is get_Artifact_SucssesState || state is GetUserDataSucssesState) buildPlayButton(state, cubit),
                  //           SizedBox(height: 12,),
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               Container(
                  //                 width: MediaQuery.sizeOf(context).width / 2.6,
                  //                 child: Text(
                  //                   AppConstants.lang
                  //                       ? '${widget.artifact_model.title_en}'
                  //                       : '${widget.artifact_model.title_ar}',
                  //                   style: TextStyle(
                  //                     fontFamily: 'CinzelDecorative',
                  //                     fontSize: 17.0,
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  buildImageRow(context, state, cubit),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppConstants.lang
                        ? '${widget.artifact_model.description_en}'
                        : '${widget.artifact_model.description_ar}',
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
          ),
        );
      },
    );
  }
  Widget buildSlider(AudioPlayingState state, AppCubit cubit) {
    return SizedBox(
      width:  MediaQuery.sizeOf(context).width / 2.1,

      child: Slider(
        activeColor: Colors.amber,
        value: state.position.inSeconds.toDouble(),
        min: 0,
        max: state.duration.inSeconds.toDouble(),
        onChanged: (value) {
          cubit.audioPlayer.seek(Duration(seconds: value.toInt()));
        },
      ),
    );
  }

  Widget buildPlayButton(AppState state, AppCubit cubit) {
    return GestureDetector(
      onTap: () {
        if (state is AudioSuccessState) {
          cubit.playAudio(state.audioUrl);
        } else if (state is AudioStoppedState || state is AppIniteal|| state is get_Artifact_SucssesState || state is GetUserDataSucssesState) {
          String? description = AppConstants.lang
              ? widget.artifact_model.description_en
              : widget.artifact_model.description_ar;
          cubit.fetchAudioUrl(description!, _selectedLanguage);
        }
      },
      child: state is AudioLoadingState
          ? CircularProgressIndicator()
          :SizedBox(
        height: 20,
        width:  MediaQuery.sizeOf(context).width / 2.3,

        child: Row(
          children: [
            SizedBox(width: 9,),
            Icon(Icons.play_circle_outline),
            SizedBox(width: 9,),
            Expanded(
              child: Divider(
                color: Colors.amber,
                thickness: 4,
              ),

            ),

          ],
        ),
      ),
    );
  }


  Widget buildImageRow(BuildContext context, AppState state, AppCubit cubit) {
    return SizedBox(
      height: 190,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.artifact_model.image!,
                fit: BoxFit.fill,
                height: 190,
                width: MediaQuery.of(context).size.width / 2.3,
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLanguageDropdown(cubit),
                if (state is AudioPlayingState || state is AudioSuccessState || state is AudioStoppedState)
                  buildAudioControls(state, cubit),
                if (!(state is AudioPlayingState || state is AudioSuccessState || state is AudioStoppedState))
                  buildInitiateButton(context, cubit,state),
                SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width / 2.6,
                                child: Text(
                                  AppConstants.lang
                                      ? '${widget.artifact_model.title_en}'
                                      : '${widget.artifact_model.title_ar}',
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
          ),
        ],
      ),
    );
  }

  Widget buildLanguageDropdown(AppCubit cubit) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Text(
          AppConstants.lang
              ? 'Languge :  '
              : ' اللغة :   ',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownButton<String>(
          value: _selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              _selectedLanguage = newValue!;
              AppConstants.lang = newValue == 'en';
              cubit.ChangeLangEmit();
            });
          },
          items: <String>['en', 'ar'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),

    SizedBox( width: 8,

    ),
        IconButton(
            onPressed:  () {
              if(!AppCubit.get(context).user_model!.favorites!.contains(widget.artifact_model.id)){
                AppCubit.get(context).make_favorite(widget.artifact_model.id);
              }else
              {
                AppCubit.get(context).remove_favorite(widget.artifact_model.id!);
              }


            },
            icon: Icon(
              AppCubit.get(context).user_model!.favorites!.contains(widget.artifact_model.id!)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
              AppCubit.get(context).user_model!.favorites!.contains(widget.artifact_model.id!)
                  ? Color(0xffE81515)
                  : Colors.black,
            )),
      ],
    );
  }

  Widget buildAudioControls(AppState state, AppCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            activeColor: Colors.amber,
            value: state is AudioPlayingState ? state.position.inSeconds.toDouble() : 0,
            min: 0,
            max: state is AudioPlayingState ? state.duration.inSeconds.toDouble() : 1,
            onChanged: (double value) {
              if (state is AudioPlayingState) {
                cubit.audioPlayer.seek(Duration(seconds: value.toInt()));
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(state is AudioPlayingState ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            if (state is AudioPlayingState) {
              cubit.stopAudio();
            } else if (state is AudioSuccessState || state is AudioStoppedState) {
              cubit.playAudio(state is AudioSuccessState ? state.audioUrl : cubit.currentAudioUrl);
            }
          },
        ),
      ],
    );
  }

  Widget buildInitiateButton(BuildContext context, AppCubit cubit,AppState state) {
    return GestureDetector(
      onTap: () {
        String? description = AppConstants.lang
            ?'${widget.artifact_model.title_en} ${widget.artifact_model.description_en}'
            : '${widget.artifact_model.title_ar} ${widget.artifact_model.description_ar}';
        cubit.fetchAudioUrl(description!, _selectedLanguage);
      },
      child: state is AudioLoadingState? SizedBox(
        width: 60,
        child: Row(
          children: [
            SizedBox(width: 9,),
            CircularProgressIndicator(
              color: Colors.amber,
            ),
            SizedBox(width: 9,),
          ],
        ),
      ) : Image.network(
        'https://img.freepik.com/premium-vector/voice-message-sign-audio-chat-element-with-play-icon-sound-wave_254622-603.jpg',
        height: 50,
        width: MediaQuery.of(context).size.width / 2.5,
        fit: BoxFit.contain,
      ),
    );
  }

}

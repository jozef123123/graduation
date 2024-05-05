
abstract class AppState {}

class AppIniteal extends AppState {}
class ChangeBottomNavBarState extends AppState {}
class changeLangState extends AppState {}

//Sign IN
class SignINLodingState extends AppState {}
class SignINSucssesState extends AppState {}
class SignINErrorState extends AppState {}

// Register
class SignUpLodingState extends AppState {}
class SignUpSucssesState extends AppState {}
class SignUpErrorState extends AppState {}
//getuser
class GetUserDataLodingState extends AppState {}
class GetUserDataSucssesState extends AppState {}
class GetUserDataErrorState extends AppState {}
//update user
class UpdateLoadingState extends AppState {}
class UpdateSucssesState extends AppState {}
class UpdateErrorState extends AppState {}
//upload hospital
class Upload_Artifact_LoadingState extends AppState {}
class Upload_Artifact_SucssesState extends AppState {}
class Upload_Artifact_ErrorState extends AppState {}
//get hospital
class get_Artifact_LoadingState extends AppState {}
class get_Artifact_SucssesState extends AppState {}
class get_Artifact_ErrorState extends AppState {}
//make favorite
class makeFavoriteLoadingState extends AppState {}
class makeFavoriteSucssesState extends AppState {}
class makeFavoriteErrorState extends AppState {}
//remove favorite
class remove_FavoriteLoadingState extends AppState {}
class remove_FavoriteSucssesState extends AppState {}
class remove_FavoriteErrorState extends AppState {}
class AudioLoadingState extends AppState {}

class AudioSuccessState extends AppState {
  final String audioUrl;
  AudioSuccessState(this.audioUrl);
}

class AudioErrorState extends AppState {}



class AudioPlayingState extends AppState {
  final String audioUrl;
  final Duration position;
  final Duration duration;
  AudioPlayingState(this.audioUrl, this.duration, this.position);
}
class AudioStoppedState extends AppState {}

//sign out
class SignOutErrorState extends AppState {}
class SignOutSucssesState extends AppState {}



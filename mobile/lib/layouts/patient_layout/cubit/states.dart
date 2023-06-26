abstract class PatientLayoutStates {}

class PatientLayoutInitiateState extends PatientLayoutStates {}

class PatientLayoutChangeBottomNavigationBarState extends PatientLayoutStates {}

class LayoutGetUsersInChatLoadingState extends PatientLayoutStates {}

class LayoutGetUsersInChatSuccessState extends PatientLayoutStates {}

class LayoutGetUsersInChatErrorState extends PatientLayoutStates {}

class LayoutGetAllUsersLoadingState extends PatientLayoutStates {}

class LayoutGetAllUsersSuccessfullyState extends PatientLayoutStates {}

class LayoutGetAllUsersErrorState extends PatientLayoutStates {}

class LayoutGetAllDoctorsLoadingState extends PatientLayoutStates {}

class LayoutGetAllDoctorsSuccessfullyState extends PatientLayoutStates {}

class LayoutGetAllDoctorsErrorState extends PatientLayoutStates {}

class LayoutGetUsersLoadingState extends PatientLayoutStates {}

class LayoutGetUsersSuccessfullyState extends PatientLayoutStates {}

class LayoutGetUsersErrorState extends PatientLayoutStates {}

class CreateChatLoadingState extends PatientLayoutStates {}

class CreateChatSuccessState extends PatientLayoutStates {}

class CreateChatErrorState extends PatientLayoutStates {}

class LayoutGetUIdsOfChatsSenderLoadingState extends PatientLayoutStates {}

class LayoutGetUIdsOfChatsSenderSuccessfullyState extends PatientLayoutStates {}

class LayoutGetUIdsOfChatsSenderErrorState extends PatientLayoutStates {}

class GetVideoLoadingState extends PatientLayoutStates {}

class GetVideoSuccessfullyState extends PatientLayoutStates {}

class GetVideoErrorState extends PatientLayoutStates {}

class InitialVideoControllerSuccessfullyState extends PatientLayoutStates {}

class GetPostsSuccessState extends PatientLayoutStates {}

class GetPostsLoadingState extends PatientLayoutStates {}

class GetPostsErrorState extends PatientLayoutStates {
  final String error;

  GetPostsErrorState(this.error);
}
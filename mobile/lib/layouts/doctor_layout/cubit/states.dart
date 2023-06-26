abstract class DoctorLayoutStates {}

class DoctorLayoutInitiateState extends DoctorLayoutStates {}

class DoctorLayoutChangeBottomNavigationBarState extends DoctorLayoutStates {}

class DoctorLayoutGetUsersInChatLoadingState extends DoctorLayoutStates {}

class DoctorLayoutGetUsersInChatSuccessState extends DoctorLayoutStates {}

class DoctorLayoutGetUsersInChatErrorState extends DoctorLayoutStates {}

class DoctorLayoutCreateChatLoadingState extends DoctorLayoutStates {}

class DoctorLayoutCreateChatSuccessState extends DoctorLayoutStates {}

class DoctorLayoutCreateChatErrorState extends DoctorLayoutStates {}

class DoctorLayoutGetAllPatientsLoadingState extends DoctorLayoutStates {}

class DoctorLayoutGetAllPatientsSuccessfullyState extends DoctorLayoutStates {}

class DoctorLayoutGetAllPatientsErrorState extends DoctorLayoutStates {}

class LayoutGetUsersInChatErrorState extends DoctorLayoutStates {}

class DoctorLayoutGetUsersLoadingState extends DoctorLayoutStates {}

class DoctorLayoutGetUsersSuccessfullyState extends DoctorLayoutStates {}

class GetDoctorProfileLoadingState extends DoctorLayoutStates {}

class GetDoctorProfileSuccessfullyState extends DoctorLayoutStates {}

class GetDoctorProfileErrorState extends DoctorLayoutStates {}

class GetNewAccessTokenLoadingState extends DoctorLayoutStates {}

class GetNewAccessTokenSuccessfullyState extends DoctorLayoutStates {}

class GetNewAccessTokenErrorState extends DoctorLayoutStates {}

class DoctorPatientListInitiateState extends DoctorLayoutStates {}

class GetDoctorPatientListSuccessfullyState extends DoctorLayoutStates {}

class GetDoctorPatientListErrorState extends DoctorLayoutStates {}

class AddVideoLoadingState extends DoctorLayoutStates {}

class AddVideoSuccessfullyState extends DoctorLayoutStates {}

class AddVideoErrorState extends DoctorLayoutStates {
  final String e;

  AddVideoErrorState(this.e);

}

class GetVideoLoadingState extends DoctorLayoutStates {}

class GetVideoSuccessfullyState extends DoctorLayoutStates {}

class GetVideoErrorState extends DoctorLayoutStates {}

class InitialVideoControllerSuccessfullyState extends DoctorLayoutStates {}

class GetPostsSuccessState extends DoctorLayoutStates {}

class GetPostsLoadingState extends DoctorLayoutStates {}

class GetPostsErrorState extends DoctorLayoutStates {
  final String error;

  GetPostsErrorState(this.error);
}
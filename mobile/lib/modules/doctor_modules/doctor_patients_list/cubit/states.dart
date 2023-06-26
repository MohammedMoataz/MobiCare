abstract class DoctorPatientListStates {}

class DoctorPatientListInitiateState extends DoctorPatientListStates {}

// class GetDoctorPatientListSuccessfullyState extends DoctorPatientListStates {}
//
// class GetDoctorPatientListErrorState extends DoctorPatientListStates {}
//
// class GetNewAccessTokenLoadingState extends DoctorPatientListStates {}
//
// class GetNewAccessTokenSuccessfullyState extends DoctorPatientListStates {}
//
// class GetNewAccessTokenErrorState extends DoctorPatientListStates {}
//
// class GetDoctorPatientListLoadingState extends DoctorPatientListStates {}

class GetSymptomsLoadingState extends DoctorPatientListStates {}

class GetSymptomsSuccessfullyState extends DoctorPatientListStates {}

class GetSymptomsErrorState extends DoctorPatientListStates {
  final String error;
  GetSymptomsErrorState({
    required this.error,
  });
}
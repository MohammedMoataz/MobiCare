abstract class PatientProfileStates {}

class PatientProfileInitiateState extends PatientProfileStates {}

class PatientProfileChangePrescriptionContainerVisibility extends PatientProfileStates {}

class PatientProfileChangeFollowUpWithContainerVisibility extends PatientProfileStates {}

class PatientProfileChangeSymptomsContainerVisibility extends PatientProfileStates {}

class GetNewAccessTokenLoadingState extends PatientProfileStates {}

class GetNewAccessTokenSuccessfullyState extends PatientProfileStates {}

class GetNewAccessTokenErrorState extends PatientProfileStates {
  final String error;
  GetNewAccessTokenErrorState({
    required this.error,
  });
}

class GetSymptomsLoadingState extends PatientProfileStates {}

class GetSymptomsSuccessfullyState extends PatientProfileStates {}

class GetSymptomsErrorState extends PatientProfileStates {
  final String error;
  GetSymptomsErrorState({
    required this.error,
  });
}

class GetDoctorsListLoadingState extends PatientProfileStates {}

class GetDoctorsListSuccessfullyState extends PatientProfileStates {}

class GetDoctorsListErrorState extends PatientProfileStates {
  final String error;
  GetDoctorsListErrorState({
    required this.error,
  });
}

class GetPatientProfileLoadingState extends PatientProfileStates {}

class GetPatientProfileSuccessfullyState extends PatientProfileStates {}

class GetPatientProfileErrorState extends PatientProfileStates {}
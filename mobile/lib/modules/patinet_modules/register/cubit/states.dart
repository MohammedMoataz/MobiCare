abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState({required this.error});
}

class RegisterLoadingFirebaseState extends RegisterStates {}

class RegisterSuccessFirebaseState extends RegisterStates {}

class RegisterErrorFirebaseState extends RegisterStates {
  final String error;
  RegisterErrorFirebaseState({required this.error});
}

class CreateUserLoadingFirebaseState extends RegisterStates {}

class CreateUserSuccessFirebaseState extends RegisterStates {}

class CreateUserErrorFirebaseState extends RegisterStates {
  final String error;
  CreateUserErrorFirebaseState({required this.error});
}

class RegisterChangePasswordVisibility extends RegisterStates {}

class CreatePatientLoadingFirebaseState extends RegisterStates {}

class CreatePatientSuccessFirebaseState extends RegisterStates {}

class CreatePatientErrorFirebaseState extends RegisterStates {}

class CreateDoctorLoadingFirebaseState extends RegisterStates {}

class CreateDoctorSuccessFirebaseState extends RegisterStates {}

class CreateDoctorErrorFirebaseState extends RegisterStates {}

class RegisterPatientLoadingFirebaseState extends RegisterStates {}

class RegisterPatientSuccessFirebaseState extends RegisterStates {}

class RegisterPatientErrorFirebaseState extends RegisterStates {}

class RegisterDoctorLoadingFirebaseState extends RegisterStates {}

class RegisterDoctorSuccessFirebaseState extends RegisterStates {}

class RegisterDoctorErrorFirebaseState extends RegisterStates {}

class ChangeWeightState extends RegisterStates {}

class ChangeTallState extends RegisterStates {}

class ChangeGenderValueState extends RegisterStates {}

class SelectDateOfBirthState extends RegisterStates {}

class RegisterationSuccessfullyState extends RegisterStates {}

class RegisterationErrorState extends RegisterStates {
  final String error;
  RegisterationErrorState({required this.error});
}
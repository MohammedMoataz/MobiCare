abstract class PatientEditProfileStates {}

class PatientEditProfileInitiateState extends PatientEditProfileStates {}

class PatientEditProfileSelectDate extends PatientEditProfileStates {}

class PatientProfileChangeFollowUpWithContainerVisibility extends PatientEditProfileStates {}

class PatientProfileChangeSymptomsContainerVisibility extends PatientEditProfileStates {}

class ChangeWeightState extends PatientEditProfileStates {}

class ChangeTallState extends PatientEditProfileStates {}

class AddSymptomLoadingState extends PatientEditProfileStates {}

class AddSymptomSuccessfullyState extends PatientEditProfileStates {}

class AddSymptomErrorState extends PatientEditProfileStates {}

class EditPatientProfileLoadingState extends PatientEditProfileStates {}

class EditPatientProfileSuccessfullyState extends PatientEditProfileStates {}

class EditPatientProfileErrorState extends PatientEditProfileStates {}
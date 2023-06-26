abstract class PrescriptionStates {}

class PrescriptionInitialState extends PrescriptionStates {}

class ChangeSessionState extends PrescriptionStates {}

class GetRecordsState extends PrescriptionStates {}

class GetSenderAddressState extends PrescriptionStates {}

class GetMedicalRecordState extends PrescriptionStates {}

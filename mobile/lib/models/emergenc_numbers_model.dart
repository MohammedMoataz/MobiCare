class EmergencyNumbersModel{
  final String title;
  final String number;

  EmergencyNumbersModel({required this.title, required this.number});
}

List<EmergencyNumbersModel> emergencyNumbersModel = [
  EmergencyNumbersModel(title: 'Main Ambulance', number: '123'),
  EmergencyNumbersModel(title: 'Tourist Police', number: '126'),
  EmergencyNumbersModel(title: 'Traffic Police', number: '128'),
  EmergencyNumbersModel(title: 'Emergency Police', number: '122'),
  EmergencyNumbersModel(title: 'Fire Department', number: '180'),
  EmergencyNumbersModel(title: 'Electricity Emergency', number: '121'),
  EmergencyNumbersModel(title: 'Natural Gas Emergency', number: '129'),
  EmergencyNumbersModel(title: 'Clock', number: '150'),
  EmergencyNumbersModel(title: 'International Calls from land lines', number: '144'),
  EmergencyNumbersModel(title: 'Land line telephone bills inquiries', number: '177'),
  EmergencyNumbersModel(title: 'Land line telephone complaints', number: '16'),
  EmergencyNumbersModel(title: 'Cairo Airport (Terminal 1)', number: '+2 2265-5000'),
  EmergencyNumbersModel(title: 'Cairo Airport (Terminal 2)', number: '+2 2265-2222'),
  EmergencyNumbersModel(title: 'Railway Information', number: '+2 2575-3555')
];
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/modules/shared_modules/chat_details/chat_details_screen.dart';
import '../../../models/doctor_patient_list_model.dart' as model;
import '../../../shared/components/components.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/styles/colors.dart';
import '../../patinet_modules/patient_prescriptions/patient_prescriptions_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

enum _MenuValues {
  AddNote,
  AddMedicalRecord,
}

class PatientProfileDoctorViewScreen extends StatelessWidget {
  model.Data data;
  bool isPrescriptionVisible = true;
  bool isSymptomsVisible = true;
  bool isNotesVisible = true;
  TextEditingController noteController = TextEditingController();
  bool isSymptomsLoad = false;
  bool isNotesLoad = false;

  PatientProfileDoctorViewScreen({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PatientProfileDoctorViewCubit()..getNotes(patientId: data.patientID!)..getSymptoms(patientId: data.patientID!),
      child: BlocConsumer<PatientProfileDoctorViewCubit, PatientProfileDoctorViewStates>(
        listener: (context, state) {
          if(state is GetSymptomsSuccessfullyState){
            isSymptomsLoad = true;
          }
          if(state is GetNoteSuccessfullyState) {
            isNotesLoad = true;
          }
        },
        builder: (context, state) {
          PatientProfileDoctorViewCubit cubit = PatientProfileDoctorViewCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor4DC_20,
              elevation: 0.0,
              actions: [
                PopupMenuButton<_MenuValues>(
                  color: primaryColor1BA,
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Add note') , value: _MenuValues.AddNote,),
                    PopupMenuItem(child: Text('Add medical record') , value: _MenuValues.AddMedicalRecord),
                  ],
                  onSelected: (value){
                    switch(value){
                      case _MenuValues.AddNote:
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Container(
                                    color: primaryWhiteColor,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Add Note',
                                          style: TextStyle(
                                            color: primaryBlackColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        TextFormField(
                                          controller: noteController,
                                          decoration: InputDecoration(
                                            hintText: 'Note',
                                            hintStyle: TextStyle(
                                              color: primaryWhiteColor.withOpacity(0.7),
                                            ),
                                            filled: true,
                                            fillColor: primaryColor1BA,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        DefaultButton(
                                          function: () {
                                            cubit.addNote(
                                                note: noteController.text.trim(),
                                                patientId: data.patientID!);
                                            Navigator.pop(context);
                                            noteController.text = "";
                                          },
                                          text: 'Done',
                                          redius: 25,
                                          backgroundColor: primaryBlueColor2C8,
                                          width: 150,
                                          height: 40,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        break;
                      case _MenuValues.AddMedicalRecord:
                        // navigateTo(context: context, widget: PatientPrescriptionScreen());
                        //
                        //
                        //
                        break;
                    }
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: primaryColor4DC_20,
                                    borderRadius: BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(8),
                                      bottomEnd: Radius.circular(8),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: SvgPicture.asset(
                                            'assets/icons/chat.svg'),
                                        onTap: () {
                                          cubit.createChat(receiverUId: data.fUID!);
                                          navigateTo(context: context, widget: ChatDetailsScreen(fuid: data.fUID!,isMale: data.gender == 0 ? false : true, name: '${data.fName} ${data.lName}', isDoctor: false, phone: data.phone!,));
                                        },
                                      ),
                                      Spacer(),
                                      InkWell(
                                        child: SvgPicture.asset(
                                            'assets/icons/telephone.svg'),
                                        onTap: () {
                                          FlutterPhoneDirectCaller.callNumber(data.phone.toString());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        DefaultImageShape(
                          isMale: data.gender == 0 ? false : true,
                          height: 80,
                          image:
                              'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '${data.fName} ${data.lName}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.dOB}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.address}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.height,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.height}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.line_weight,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.weight}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.email}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              data.gender == 0 ? Icons.female : Icons.male,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              data.gender == 0 ? 'Female' : 'Male',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 28,
                              color: primaryColor1BA,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${data.gender}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Divider(),
                        InkWell(
                          onTap: () {
                            isSymptomsVisible = !isSymptomsVisible;
                            cubit.changeSymptomsVisibility(isSymptomsVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Symptoms',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(isSymptomsVisible == true
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                        if (isSymptomsVisible)
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 8.0),
                              child: ConditionalBuilder(
                                condition: state is GetSymptomsSuccessfullyState || isSymptomsLoad,
                                builder: (context) {
                                  if(cubit.symptoms!.data!.isNotEmpty) {
                                    return  Wrap(
                                    children: [
                                      for(int i = 0 ; i < cubit.symptoms!.data!.length ; i++)
                                        DefaultSymptomItem(
                                          nameOfSymptom: '${cubit.symptoms!.data![i].symptom}',
                                        ),
                                    ],
                                  );
                                  } else {
                                    return  Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/symptoms_not_found.svg',
                                          height: 150,
                                          width: 150,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('There is no symptoms.'),
                                      ],
                                    );
                                  }
                                },
                                fallback: (context) => SvgPicture.asset(
                                  'assets/svg/error.svg',
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            ),
                          ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            isPrescriptionVisible = !isPrescriptionVisible;
                            cubit.changePrescriptionVisibility(
                                isPrescriptionVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Prescriptions',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(isPrescriptionVisible == true
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                        if (isPrescriptionVisible)
                          Column(
                            children: [
                              BuildPrescriptionItem(
                                  dateTime: '5 / 10 ? 2021',
                                  doctorName: 'Dr.Ali'),
                              BuildPrescriptionItem(
                                  dateTime: '5 / 10 ? 2021',
                                  doctorName: 'Dr.Ali'),
                              BuildPrescriptionItem(
                                  dateTime: '5 / 10 ? 2021',
                                  doctorName: 'Dr.Ali'),
                              BuildPrescriptionItem(
                                  dateTime: '5 / 10 ? 2021',
                                  doctorName: 'Dr.Ali'),
                            ],
                          ),
                        if (isPrescriptionVisible)
                          SizedBox(
                            height: 10,
                          ),
                        if (isPrescriptionVisible)
                          SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                navigateTo(
                                    context: context,
                                    widget: PatientPrescriptionScreen());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  'SEE MORE',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 25,
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            isNotesVisible = !isNotesVisible;
                            cubit.changeNotesVisibility(isPrescriptionVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Notes',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(isNotesVisible == true
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                        if (isNotesVisible)
                          SizedBox(
                            height: 200,
                            child: ConditionalBuilder(
                              condition: state is AddNoteSuccessfullyState || state is GetNoteSuccessfullyState || isNotesLoad,
                              builder: (context) {
                                if(cubit.noteModel!.data!.isNotEmpty){
                                  return  ListView.builder(
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${cubit.noteModel!.data![index].noteID}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: primaryColor1BA,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${cubit.noteModel!.data![index].noteContent}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  '${cubit.noteModel!.data![index].creationDate}',
                                                  style: TextStyle(
                                                    color: primaryColor1BA,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    itemCount: cubit.noteModel!.data!.length,
                                  );
                                }
                                else{
                                  return Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/note.svg',
                                        height: 150,
                                        width: 150,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('There is no notes.'),
                                    ],
                                  );
                                }
                              },
                              fallback: (context) => SvgPicture.asset(
                                'assets/svg/error.svg',
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import '../../../shared/components/pop_up_component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientMedicationReminderScreen extends StatelessWidget {
  PatientMedicationReminderScreen({Key? key}) : super(key: key);

  TextEditingController medicineNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientMedicationReminderCubit,
        PatientMedicationReminderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PatientMedicationReminderCubit cubit =
            PatientMedicationReminderCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/svg/medication_reminder/medication_reminder.svg'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'You can set an alarm for medication appointments',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      onTap: () {
                        showPopUp(
                          context: context,
                          content: ReminderPopUp(
                            controller: medicineNameController,
                            descriptionController: descriptionController,
                            dateTime: dateTime,
                            cubit: cubit,
                            hintText: 'Medicine name',
                            insertMethod: () {
                              cubit.insertToDatabase(
                                nameOfMedicine: medicineNameController.text,
                                timeOfMedicine: cubit.dateTime.toString(),
                                description: descriptionController.text ?? " ",
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryColor1BA.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Add a new medicine',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SvgPicture.asset(
                                    'assets/icons/medicines_icon.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            cubit.deleteData(id: cubit.medicines[index]['id']);
                          },
                          child: MedicationReminderContainer(
                            name: cubit.medicines[index]['name'],
                            timeInHour:
                                DateTime.parse(cubit.medicines[index]['time'])
                                    .hour
                                    .toString(),
                            timeInMinute:
                                DateTime.parse(cubit.medicines[index]['time'])
                                    .minute
                                    .toString(),
                            isTimeAM: int.parse(DateTime.parse(
                                            cubit.medicines[index]['time'])
                                        .hour
                                        .toString()) <=
                                    12
                                ? true
                                : false,
                            howTimes: cubit.medicines[index]['description'],
                          ),
                        );
                      },
                      itemCount: cubit.medicines.length,
                      // physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

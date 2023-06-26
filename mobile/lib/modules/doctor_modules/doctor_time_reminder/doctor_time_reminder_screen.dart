import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:mobi_care/shared/components/pop_up_component.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class DoctorTimeReminderScreen extends StatelessWidget {
  DoctorTimeReminderScreen({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorTimeReminderCubit, DoctorTimeReminderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        DoctorTimeReminderCubit cubit = DoctorTimeReminderCubit.get(context);
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
                    'assets/svg/doctor_time_reminder/doctor_time.svg',
                    width: double.infinity,
                    height: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'You can set an alarm for your tasks',
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
                            controller: titleController,
                            descriptionController: descriptionController,
                            dateTime: dateTime,
                            cubit: cubit,
                            hintText: 'Task name',
                            insertMethod: () {
                              cubit.insertToDatabase(
                                titleOfTask: titleController.text,
                                timeOfTask: cubit.dateTime.toString(),
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
                                  'Add a new task',
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
                                    'assets/svg/doctor_time_reminder/task.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            cubit.deleteData(id: cubit.tasks[index]['id']);
                          },
                          child: MedicationReminderContainer(
                            name: cubit.tasks[index]['title'],
                            timeInHour:
                                DateTime.parse(cubit.tasks[index]['time'])
                                    .hour
                                    .toString(),
                            timeInMinute:
                                DateTime.parse(cubit.tasks[index]['time'])
                                    .minute
                                    .toString(),
                            isTimeAM: int.parse(DateTime.parse(
                                            cubit.tasks[index]['time'])
                                        .hour
                                        .toString()) <=
                                    12
                                ? true
                                : false,
                            howTimes: cubit.tasks[index]['description'],
                          ),
                        );
                      },
                      itemCount: cubit.tasks.length,
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

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/states.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import '../../../shared/components/navigate_component.dart';
import '../../shared_modules/chat_details/chat_details_screen.dart';

class PatientChatScreen extends StatelessWidget {
  const PatientChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        PatientLayoutCubit cubit = PatientLayoutCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConditionalBuilder(
            condition: cubit.users.length > 0,
            builder: (context) => ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  navigateTo(
                    context: context,
                    widget: ChatDetailsScreen(isDoctor: true , name: 'Dr. ${cubit.users[index].firstName} ${cubit.users[index].lastName}' , isMale: cubit.users[index].isMale , fuid: cubit.users[index].uId , phone: ''),
                  );
                  cubit.createChat(receiverUId: cubit.users[index].uId);
                },
                child: DefaultChatRowUserViewItem(
                    context: context,
                    model: cubit.users[index],
                    lastMessage: 'Hi',
                    dateOfLastMassage: '1/6/2023',
                    numberOfMessage: '0',
                ),
              ),
              itemCount: cubit.users.length,
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: primaryColor1BA,
              ),
            ),
          ),
        );
      },
    );
  }
}
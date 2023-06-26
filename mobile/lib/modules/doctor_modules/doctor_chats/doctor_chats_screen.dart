import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/states.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/doctor_chat_component.dart';

import '../../../shared/components/navigate_component.dart';
import '../../shared_modules/chat_details/chat_details_screen.dart';

class DoctorChatsScreen extends StatelessWidget {
  const DoctorChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorLayoutCubit , DoctorLayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ConditionalBuilder(
            condition: cubit.users.length > 0,
            builder: (context) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      navigateTo(
                        context: context,
                        widget: ChatDetailsScreen(fuid: cubit.users[index].uId , isDoctor: false, isMale: cubit.users[index].isMale , name: '${cubit.users[index].firstName} ${cubit.users[index].lastName}' , phone: ''),
                      );
                      cubit.createChat(receiverUId: cubit.users[index].uId!);
                    },
                    child: DoctorChatComponent(
                        image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                        isMale: cubit.users[index].isMale,
                        name: '${cubit.users[index].firstName} ${cubit.users[index].lastName}',
                        numberOfMassages: 5,
                        function: (){

                        }
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: cubit.users.length,
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

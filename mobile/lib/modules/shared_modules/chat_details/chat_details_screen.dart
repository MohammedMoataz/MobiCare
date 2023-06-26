import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mobi_care/models/user_model.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChatDetailsScreen extends StatelessWidget {

  TextEditingController messageController = TextEditingController();
  final String fuid;
  final String name;
  final bool isDoctor;
  final bool isMale;
  final String phone;

  ChatDetailsScreen({required this.fuid, required this.name, required this.isDoctor, required this.isMale, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ChatMessagesCubit.get(context).getMessages(receiverId: fuid!);
        return BlocConsumer<ChatMessagesCubit , ChatMessagesStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            ChatMessagesCubit cubit = ChatMessagesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor1BA,
                title: Row(
                  children: [
                    if(isDoctor)
                      DoctorImageComponent(
                        image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                        height: 40,
                      ),
                    if(!isDoctor)
                    DefaultImageShape(
                        isMale: isMale,
                        image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                        height: 40
                    ),
                    Expanded(
                      child: Text(
                        '$name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryWhiteColor
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(onPressed: (){
                    FlutterPhoneDirectCaller.callNumber(phone.trim().toString());
                  }, icon: Icon(Icons.call_outlined))
                ],
              ),
              body: Column(
                children: [
                  ConditionalBuilder(
                    condition: cubit.messages.length > 0,
                    builder: (context) =>  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if(uId == cubit.messages[index].senderId){
                                return buildMyMessage(cubit.messages[index].messageText);
                              }else{
                                return buildMessage(cubit.messages[index].messageText);
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 15,),
                            itemCount: cubit.messages.length
                        ),
                      ),
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                  if(cubit.messages.length == 0)
                    Spacer(),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor1BA,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Message..',
                                  fillColor: primaryWhiteColor,
                                  filled: true
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 49,
                          color: primaryColor1BA,
                          child: MaterialButton(
                            minWidth: 1,
                            onPressed: (){
                              cubit.sendMessage(
                                receiverId: fuid,
                                dateTime: DateTime.now().toString(),
                                  messageText: messageController.text,
                              );
                              messageController.text = '';
                            },
                            child: Icon(
                              Icons.send_outlined,
                              color: primaryWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            );
          },
        );
      }
    );
  }

  Widget buildMessage(String message){
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.20),
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomEnd: Radius.circular(10.0)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMyMessage(String message){
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.70),
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}

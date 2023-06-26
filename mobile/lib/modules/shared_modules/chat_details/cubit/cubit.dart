import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/message_model.dart';
import '../../../../shared/constants/constants.dart';
import 'states.dart';


class ChatMessagesCubit extends Cubit<ChatMessagesStates>{

  ChatMessagesCubit():super(InitChatMessagesStats());

  static ChatMessagesCubit get(BuildContext context) => BlocProvider.of(context);

  String getChatId({
    required String receiverUId,
  }){
    if(uId!.substring(0,1).codeUnitAt(0) > receiverUId.substring(0,1).codeUnitAt(0)){
      return '$receiverUId\_${uId!}';
    }else{
      return '${uId!}\_${receiverUId}';
    }
  }

  void createChat({required String receiverUId}) {

    List<String> users = [
      uId!,
      receiverUId
    ];
    Map<String , dynamic> chatMap = {
      'users': users,
      'chatId' : getChatId(receiverUId: receiverUId),
    };
    emit(CreateChatLoadingState());
    FirebaseFirestore.instance
        .collection('chats')
        .doc('${uId!}_$receiverUId')
        .set(chatMap)
        .then((value) {
          emit(CreateChatSuccessState());
    }).catchError((error){
      print('Error : ${error.toString()}');
      emit(CreateChatErrorState());
    });
  }

  void sendMessage({
    required String messageText,
    required String receiverId,
    required String dateTime,
  }){

    MessageModel messageModel = MessageModel(
      senderId: uId!,
      receiverId: receiverId,
      dateTime: dateTime,
      messageText: messageText,
    );

    String chatId = getChatId(receiverUId: receiverId);

    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];
  void getMessages({
  required String receiverId,
}){
    try{
      String chatId = getChatId(receiverUId: receiverId);
      FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('dateTime')
          .snapshots()
          .listen((event) {
        messages = [];
        event.docs.forEach((element) {
          messages.add(MessageModel.fromJson(element.data()));
        });
        emit(GetMessageSuccessState());
      });
    }catch(e){
      emit(GetMessageErrorState());
    }
  }
}
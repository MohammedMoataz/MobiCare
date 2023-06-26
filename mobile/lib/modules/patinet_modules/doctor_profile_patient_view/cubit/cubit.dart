import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constants/constants.dart';
import 'states.dart';

class DoctorProfilePatientViewCubit extends Cubit<DoctorProfilePatientViewStates> {
  DoctorProfilePatientViewCubit() : super(DoctorProfilePatientViewInitiateState());

  static DoctorProfilePatientViewCubit get(BuildContext context) => BlocProvider.of(context);


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
    emit(DoctorLayoutCreateChatLoadingState());
    try{
      FirebaseFirestore.instance
          .collection('chats')
          .doc('${uId!}_$receiverUId')
          .set(chatMap)
          .then((value) {
        emit(DoctorLayoutCreateChatSuccessState());
      });
    }catch(e){
      print('Error : ${e.toString()}');
      emit(DoctorLayoutCreateChatErrorState());
    }
  }
}
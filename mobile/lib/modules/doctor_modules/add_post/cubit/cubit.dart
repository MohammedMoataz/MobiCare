import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobi_care/models/post_model.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mobi_care/shared/constants/constants.dart';

class AddPostCubit extends Cubit<AddPostStates> {

  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(BuildContext context) => BlocProvider.of(context);


  void createPost({
    required String datetime,
    required String text,
  }){
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
        firstName: asDoctorModel!.data!.fName,
        lastName: asDoctorModel!.data!.lName,
        isMale: asDoctorModel!.data!.gender == 0 ? false : true,
        dateTime: datetime,
        caption: text,
        imageUrl: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error){
      emit(CreatePostErrorState());
    });
  }
}
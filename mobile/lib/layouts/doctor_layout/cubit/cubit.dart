import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/doctor_patient_list_model.dart';
import '../../../models/get_doctor_profile_model.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';
import '../../../models/video_model.dart';
import '../../../modules/doctor_modules/doctor_chats/doctor_chats_screen.dart';
import '../../../modules/doctor_modules/doctor_home/doctor_home_screen.dart';
import '../../../modules/doctor_modules/doctor_patients_list/doctor_patients_list_screen.dart';
import '../../../modules/doctor_modules/doctor_time_reminder/doctor_time_reminder_screen.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_point.dart';
import 'states.dart';

class DoctorLayoutCubit extends Cubit<DoctorLayoutStates> {
  DoctorLayoutCubit() : super(DoctorLayoutInitiateState());

  static DoctorLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> bottomScreens =  [
    DoctorTimeReminderScreen(),
    DoctorPatientsListScreen(),
    DoctorHomeScreen(),
    DoctorChatsScreen(),
  ];

  List<Widget> bottomNavIcons = [
    SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg' , width: 24,),
    SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
    // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
  ];

  void changeBottomIndex(int index) async{
    currentIndex = index;
    if(index == 0){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 1){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      getDoctorPatients();
    } else if(index == 2){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      getVideos();
    }else if(index == 3){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      await getChats();
    }else if(index == 4){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/clock_not_active.svg', width: 24,),
        SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
      ];
    }
    emit(DoctorLayoutChangeBottomNavigationBarState());
  }

  DoctorPatientListModel ? doctorPatientListModel;

  void getDoctorPatients(){
    emit(DoctorPatientListInitiateState());
    try{
      DioHelper.getData(
        token: accessToken,
        path: '${GET_DOCTOR_PATIENTS}${asDoctorModel!.data!.iD}',
      ).then((value) {
        print(value.data);
        doctorPatientListModel = DoctorPatientListModel.fromJson(value.data);
        print(doctorPatientListModel!.data![0].fName);
        emit(GetDoctorPatientListSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(GetDoctorPatientListErrorState());
    }
  }

  UserModel ? userModel;

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
    String chatId = getChatId(receiverUId: receiverUId);
    emit(DoctorLayoutCreateChatLoadingState());
    try{
      FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .set(chatMap)
          .then((value) {
        emit(DoctorLayoutCreateChatSuccessState());
      });
    }catch(e){
      print('Error : ${e.toString()}');
      emit(DoctorLayoutCreateChatErrorState());
    }
  }

  List<UserModel> patients = [];
  Future<void> getAllPatient() async{
    emit(DoctorLayoutGetAllPatientsLoadingState());
    if(patients.isEmpty){
      await FirebaseFirestore.instance
          .collection('patients')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          patients.add(UserModel.fromJson(element.data()));
        });
        emit(DoctorLayoutGetAllPatientsSuccessfullyState());
      }).catchError((error) {
        emit(DoctorLayoutGetAllPatientsErrorState());
        print(error.toString());
      });
    }
  }

  List<UserModel> users = [];
  List<String> chatsUsersId = [];
  Future<void> getChatsUsersId() async{
    List<String> chatsUsersId = [];
    try{
      await FirebaseFirestore.instance
          .collection('chats')
          .where('users' , arrayContains: uId)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          users = [];
          for(int i = 0 ; i < patients.length ; i++){
            // print(doctors[i]);
            if(patients[i].uId == element.data().values.first.replaceAll(uId!, '').replaceAll('_', '').trim()){
              users.add(patients[i]);
            }
          }
          chatsUsersId.add(element.data().values.first.replaceAll(uId!, '').replaceAll('_', '').trim());
        });
        print(users);
      });
    }catch(e){
      emit(LayoutGetUsersInChatErrorState());
    }
  }


  void getChatsITalkWith(){
    emit(DoctorLayoutGetUsersLoadingState());
    if(chatsUsersId.isNotEmpty){
      for(int i = 0 ; i < chatsUsersId.length ; i++){
        for(int j = 0 ; j < patients.length ; j++){
          if(chatsUsersId[i] == patients[j].uId){
            users.add(UserModel(
              uId: patients[j].uId,
              imageUrl: patients[j].imageUrl,
              lastName: patients[j].lastName,
              firstName: patients[j].firstName,
              role: patients[j].role,
              isMale: patients[j].isMale,
              address: patients[j].address,
              email: patients[j].email,
            ));
            // users.add(patients[i]);
            print('users :   $users');
            print(users.length);
          }
          break;
        }
      }
      print('users ########: $users');
      print('Length: ${users.length}');
      emit(DoctorLayoutGetUsersSuccessfullyState());
    }
  }

  Future<void> getChats() async{
    await getAllPatient().then((value) {
      getChatsUsersId().then((value) {
        getChatsITalkWith();
      });
    });
  }

  void addVideo({
    required String videoUrl,
    required String videoDescription,
  }){
    emit(AddVideoLoadingState());
    try{
      DioHelper.postData(
        url: ADD_VIDEO,
        data: {
          'VIDEO_URL': videoUrl,
          'VIDEO_DESC': videoDescription
        },
        token: asDoctorModel!.accessToken,
      ).then((value) {
        print(value.data);
        print("%%%%%%%%%%%%%%%%%%%%%%%% Add Video %%%%%%%%%%%%%%%%%");
        emit(AddVideoSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(AddVideoErrorState(e.toString()));
    }
  }

  VideoModel ? videoModel ;
  void getVideos(){
    emit(GetVideoLoadingState());
    try{
      DioHelper.getData(
        path: GET_ALL_VIDEOS,
      ).then((value) {
        print('%%%%%%%%%%%%%%%%%%%  Get Videos %%%%%%%%%%%%%%%%%%%%%%%%');
        print(value.data);
        videoModel = VideoModel.fromJson(value.data);
        print(videoModel);
        print(videoModel!.data!.length);
        emit(GetVideoSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(GetVideoErrorState());
    }
  }

  YoutubePlayerController ? controller;
  void initialController({required String videoUrl}){
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    emit(InitialVideoControllerSuccessfullyState());
  }


  List<PostModel> posts =[];
  List<String> postId = [];
  void getPosts() async{
    emit(GetPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          posts = [];
          postId = [];
            value.docs.forEach((element) {
              posts.add(PostModel.fromJson(element.data()));
              postId.add(element.id);
              emit(GetPostsSuccessState());
            });
    }).catchError((error){
      print(error.toString());
      emit(GetPostsErrorState( error));
    });
  }
}
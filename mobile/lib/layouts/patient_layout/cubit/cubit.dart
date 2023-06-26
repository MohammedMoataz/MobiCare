import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';
import '../../../models/video_model.dart';
import '../../../modules/patinet_modules/patient_chat/patient_chat_screen.dart';
import '../../../modules/patinet_modules/patient_home/patient_home_screen.dart';
import '../../../modules/patinet_modules/patient_medication_reminder/patient_medication_reminder_screen.dart';
import '../../../modules/patinet_modules/patient_posts_view/patient_posts_view_screen.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_point.dart';
import 'states.dart';

class PatientLayoutCubit extends Cubit<PatientLayoutStates> {
  PatientLayoutCubit() : super(PatientLayoutInitiateState());

  static PatientLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> bottomScreens =  [
    PatientMedicationReminderScreen(),
    PatientPostsViewScreen(),
    PatientHomeScreen(),
    PatientChatScreen(),
    // PatientContactScreen(),
  ];

  List<Widget> bottomNavIcons = [
    SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
    SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
    // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
  ];

  void changeBottomIndex(int index) async{
    currentIndex = index;
    if(index == 0){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 1){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      getVideos();
    } else if(index == 2){
      bottomNavIcons = [ SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
    }else if(index == 3){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_not_active.svg'),
      ];
      await getChats();
    }else if(index == 4){
      bottomNavIcons = [
        SvgPicture.asset('assets/bottom_nav_icons/medication_reminder_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/video_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/home_not_active.svg'),
        SvgPicture.asset('assets/bottom_nav_icons/chat_not_active.svg'),
        // SvgPicture.asset('assets/bottom_nav_icons/contact_active.svg'),
      ];
    }
    emit(PatientLayoutChangeBottomNavigationBarState());
  }

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
    emit(CreateChatLoadingState());
    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .set(chatMap)
        .then((value) {
      emit(CreateChatSuccessState());
    }).catchError((error){
      print('Error : ${error.toString()}');
      emit(CreateChatErrorState());
    });
  }

  List<UserModel> doctors = [];
  Future<void> getAllDoctors() async{
    emit(LayoutGetAllDoctorsLoadingState());
    if(doctors.isEmpty){
      await FirebaseFirestore.instance
          .collection('doctors')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          doctors.add(UserModel.fromJson(element.data()));
        });
        emit(LayoutGetAllDoctorsSuccessfullyState());
      }).catchError((error) {
        emit(LayoutGetAllDoctorsErrorState());
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
          for(int i = 0 ; i < doctors.length ; i++){
            // print(doctors[i]);
            if(doctors[i].uId == element.data().values.first.replaceAll(uId!, '').replaceAll('_', '').trim()){
              users.add(doctors[i]);
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
    emit(LayoutGetUsersLoadingState());
    if(chatsUsersId.isNotEmpty){
      for(int i = 0 ; i < chatsUsersId.length ; i++){
        for(int j = 0 ; j < doctors.length ; j++){
          if(chatsUsersId[i] == doctors[j].uId){
            users.add(UserModel(
              uId: doctors[j].uId,
              imageUrl: doctors[j].imageUrl,
              lastName: doctors[j].lastName,
              firstName: doctors[j].firstName,
              role: doctors[j].role,
              isMale: doctors[j].isMale,
              address: doctors[j].address,
              email: doctors[j].email,
            ));
            // users.add(doctors[i]);
            print('users :   $users');
            print(users.length);
          }
          break;
        }
      }
      print('users ########: $users');
      print('Length: ${users.length}');
      emit(LayoutGetUsersSuccessfullyState());
    }
  }

  Future<void> getChats() async{
    await getAllDoctors().then((value) {
      getChatsUsersId().then((value) {
        getChatsITalkWith();
      });
    });
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
  void getPosts(){
    emit(GetPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
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
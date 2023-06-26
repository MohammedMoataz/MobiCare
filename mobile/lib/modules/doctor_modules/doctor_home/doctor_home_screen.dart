import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/states.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/add_post_screen.dart';
import 'package:mobi_care/modules/doctor_modules/home_visit_requests/home_visit_requests.dart';
import 'package:mobi_care/modules/shared_modules/post_details/post_details_screen.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';

import '../../../layouts/doctor_layout/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';


class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({Key? key}) : super(key: key);

  TextEditingController videoUrlController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  bool videoIsLoaded = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorLayoutCubit , DoctorLayoutStates>(
      listener: (context , state) {
        if(state is GetVideoSuccessfullyState){
          videoIsLoaded = true;
        }
      },
      builder: (context, state) {
        DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  buildHomeItemContainer(
                    title: 'Home visit',
                    buttonText: 'Book a home visit',
                    function: (){
                      navigateTo(context: context, widget: HomeVisitRequestsScreen());
                    },
                    svgPath: 'assets/svg/patient_home/patient_home_1.svg',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is GetVideoSuccessfullyState || videoIsLoaded,
                    builder: (context) {
                      return Expanded(
                        child: ListView.separated(
                          itemCount: cubit.videoModel!.data!.length,
                          itemBuilder: (context, index) {
                            cubit.initialController(videoUrl: cubit.videoModel!.data![index].videoURL!);
                            return InkWell(
                              onTap: (){
                                navigateTo(context: context, widget: PostDetailsScreen(
                                  firstName: cubit.videoModel!.data![index].fName!,
                                  controller:  cubit.controller!,
                                  caption: cubit.videoModel!.data![index].videoDesc!,
                                  creationalDate: cubit.videoModel!.data![index].creationDate!,
                                  gender: cubit.videoModel!.data![index].gender == 0? false : true,
                                  lastName: cubit.videoModel!.data![index].lName!,
                                ));
                              },
                              child: DefaultPostView(
                                publisherName: '${cubit.videoModel!.data![index].fName} ${cubit.videoModel!.data![index].lName}',
                                publisherImage: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                                postText: '${cubit.videoModel!.data![index].videoDesc}',
                                isMale: cubit.videoModel!.data![index].gender == 0 ? false : true,
                                videoUrl: cubit.videoModel!.data![index].videoURL!,
                                dateOfPublish: cubit.videoModel!.data![index].creationDate!,
                                controller: cubit.controller!,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                        ),
                      );
                    },
                    fallback: (context) {
                      return Center(child: Text('There is no videos'),);
                    },
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Container(
                                color: primaryWhiteColor,
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: videoUrlController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter video url',
                                        hintStyle: TextStyle(
                                          color: primaryWhiteColor.withOpacity(0.7),
                                        ),
                                        filled: true,
                                        fillColor: primaryColor1BA,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      maxLines: 3,
                                      controller: descreptionController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Caption',
                                        hintStyle: TextStyle(
                                          color: primaryWhiteColor.withOpacity(0.7),
                                        ),
                                        filled: true,
                                        fillColor: primaryGreyColor808.withOpacity(0.3),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    DefaultButton(
                                      function: (){
                                        cubit.addVideo(
                                          videoUrl: videoUrlController.text,
                                          videoDescription: descreptionController.text,
                                        );
                                        Navigator.pop(context);
                                        videoUrlController.text = "";
                                        descreptionController.text = "";
                                      },
                                      text: 'Done',
                                      redius: 25,
                                      backgroundColor: primaryBlueColor2C8,
                                      width: 150,
                                      height: 40,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor1BA,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      child: Text(
                        'Add new video',
                        style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildHomeItemContainer({
    required String title,
    required String buttonText,
    required Function() function,
    required String svgPath,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor60D_10 ,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(title , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DefaultButtonWithCircleAvatar(
                          function: function,
                          text: 'View Requisites',
                          redius: 20,
                          width: 200,
                          height: 45,
                          fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(svgPath),
            ),
          ],
        ),
      ),
    );
  }
}

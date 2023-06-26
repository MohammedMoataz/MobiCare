import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/states.dart';
import 'package:mobi_care/modules/shared_modules/post_details/post_details_screen.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';

class PatientPostsViewScreen extends StatelessWidget {
  PatientPostsViewScreen({Key? key}) : super(key: key);

  bool videoIsLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
      listener: (context, state) {
        if(state is GetVideoSuccessfullyState){
          videoIsLoaded = true;
        }
      },
      builder: (context, state) {
        PatientLayoutCubit cubit = PatientLayoutCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConditionalBuilder(
            condition: state is GetVideoSuccessfullyState || videoIsLoaded,
            builder: (context) {
              return ListView.separated(
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
              );
            },
            fallback: (context) {
              return Center(child: Text('There is no videos'),);
            },
          ),
        );
      },
    );
  }
}

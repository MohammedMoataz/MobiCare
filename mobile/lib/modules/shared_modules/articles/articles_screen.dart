import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/states.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/add_post_screen.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorLayoutCubit , DoctorLayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor1BA,
            title: Text('MobiCare'),
            centerTitle: true,
            actions: [
              if(asDoctorModel != null)
                PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Add Article') , value: 1,),
                ],
                onSelected: (value){
                  switch(value){
                    case 1:
                      navigateTo(context: context, widget: NewPostScreen());
                      break;
                  }
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 8.0),
              child: ConditionalBuilder(
                condition: DoctorLayoutCubit.get(context).posts.length > 0,
                builder: (context) => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => DefaultArticleView(
                            publisherName: 'Dr. ${cubit.posts[index].firstName} ${cubit.posts[index].lastName}',
                            publisherImage: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                            postText: '${cubit.posts[index].caption}',
                            dateOfPublish: cubit.posts[index].dateTime!,
                            isMale: cubit.posts[index].isMale!,
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: DoctorLayoutCubit.get(context).posts.length,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }

}
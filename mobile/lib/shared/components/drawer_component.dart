import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/layouts/doctor_drawer/cubit/cubit.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import '../../layouts/doctor_drawer/cubit/status.dart';
import '../../layouts/patient_drawer/cubit/cubit.dart';
import '../../layouts/patient_drawer/cubit/states.dart';
import '../styles/colors.dart';
import 'components.dart';

class BuildClickableDrawerItem extends StatelessWidget {
  final String svgIcon;
  final String title;
  final BuildContext context;
  final int index;

  const BuildClickableDrawerItem(
      {required this.svgIcon,
      required this.title,
      required this.context,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientDrawerLayoutCubit(),
      child: BlocConsumer<PatientDrawerLayoutCubit, PatientDrawerLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocProvider(
            create: (context) => PatientDrawerLayoutCubit(),
            child: BlocConsumer<PatientDrawerLayoutCubit, PatientDrawerLayoutStates>(
              listener: (context, state) {},
              builder: (context, state) {
                PatientDrawerLayoutCubit cubit = PatientDrawerLayoutCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: () {
                      cubit.changeScreen(index, context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset(svgIcon , width: 22,height: 22,),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: primaryBlackColor, fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DrawerLayoutHeader extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final bool isMale;

  const DrawerLayoutHeader(
      {required this.image, required this.name, required this.email , required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor60D_50,
      width: double.infinity,
      height: 240,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultImageShape(isMale: isMale, image: image),
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class BuildClickableDrawerItemForDoctor extends StatelessWidget {
  final String svgIcon;
  final String title;
  final BuildContext context;
  final int index;

  const BuildClickableDrawerItemForDoctor(
      {required this.svgIcon,
        required this.title,
        required this.context,
        required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorDrawerLayoutCubit(),
      child: BlocConsumer<DoctorDrawerLayoutCubit, DoctorDrawerLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocProvider(
            create: (context) => DoctorDrawerLayoutCubit(),
            child: BlocConsumer<DoctorDrawerLayoutCubit, DoctorDrawerLayoutStates>(
              listener: (context, state) {},
              builder: (context, state) {
                DoctorDrawerLayoutCubit cubit = DoctorDrawerLayoutCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: () {
                      cubit.changeScreen(index, context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          SvgPicture.asset(svgIcon),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: primaryBlackColor, fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DoctorDrawerLayoutHeader extends StatelessWidget {
  final String image;
  final String name;
  final String email;

  const DoctorDrawerLayoutHeader(
      {required this.image, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor60D_50,
      width: double.infinity,
      height: 240,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DoctorImageComponent(
            image: image,
            height: 80,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

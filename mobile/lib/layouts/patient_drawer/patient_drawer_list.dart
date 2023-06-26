import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/build_clickable_drawer_item_component.dart';
import '../../shared/components/drawer_component.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientDrawerLayoutList extends StatelessWidget {
  const PatientDrawerLayoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          BuildClickableDrawerItem(
              index: 0,
              svgIcon: 'assets/drawer_icons/profile.svg',
              title: 'Profile',
              context: context,
          ),
          BuildClickableDrawerItem(
              index: 1,
              svgIcon: 'assets/drawer_icons/prescriptions.svg',
              title: 'Prescription',
              context: context
          ),
          BuildClickableDrawerItem(
              index: 2,
              svgIcon: 'assets/bottom_nav_icons/video_not_active.svg',
              title: 'Article',
              context: context
          ),
          BuildClickableDrawerItem(
              index: 3,
              svgIcon: 'assets/drawer_icons/call.svg',
              title: 'Emergency numbers',
              context: context
          ),
          BuildClickableDrawerItem(
              index: 4,
              svgIcon: 'assets/drawer_icons/setting.svg',
              title: 'Settings',
              context: context
          ),
          Divider(
            height: 1.0,
            color: primaryGreyColor808,
          ),
          BuildClickableDrawerItem(
              index: 5,
              svgIcon: 'assets/drawer_icons/log_out.svg',
              title: 'Log out',
              context: context
          ),
        ],
      ),
    );
  }
}
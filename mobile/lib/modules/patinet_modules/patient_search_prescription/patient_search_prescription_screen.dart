import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';

import '../../../shared/styles/colors.dart';

class PatientSearchPrescriptionScreen extends StatelessWidget {
  PatientSearchPrescriptionScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    filled: true,
                    fillColor: primaryGreyColorD9D_50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    BuildPrescriptionItem(dateTime: '14 / 2 /2005' , doctorName: 'Dr.Ahmed Ali'),
                    BuildPrescriptionItem(dateTime: '14 / 2 /2005' , doctorName: 'Dr.Ahmed Ali'),
                    BuildPrescriptionItem(dateTime: '14 / 2 /2005' , doctorName: 'Dr.Ahmed Ali'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

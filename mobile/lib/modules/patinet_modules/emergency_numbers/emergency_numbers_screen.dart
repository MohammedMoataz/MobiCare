import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/models/emergenc_numbers_model.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class EmergencyNumbersScreen extends StatelessWidget {
  const EmergencyNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobiCare'),
        backgroundColor: primaryColor1BA,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => buildEmergencyContactNumber(title: emergencyNumbersModel[index].title, number: emergencyNumbersModel[1].number),
        itemCount: emergencyNumbersModel.length,
      ),
    );
  }

  Widget buildEmergencyContactNumber({
    required String title,
    required String number,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      color: primaryColor1BA,
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () async{
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  child: SvgPicture.asset('assets/drawer_icons/call.svg' , width: 28,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import '../../../shared/components/navigate_component.dart';
import '../payment_done/payment_done_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  bool isChecked = false;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit , PaymentStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primaryColor60D,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: primaryColor60D,
            title: Text(
              'Add New Card',
              style: TextStyle(
                  color: primaryWhiteColor
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            alignment: AlignmentDirectional.bottomCenter,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SizedBox(

                    height: 610,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: 570,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryWhiteColor,
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(40),
                              topStart: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  'Card Number',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                DefaultTextFormFieldWithoutBorder(
                                  controller: cardNumberController,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Expiry Date',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Expanded(
                                              child: DefaultTextFormFieldWithoutBorder(
                                                controller: expiryDateController,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'CVV',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Expanded(
                                              child: DefaultTextFormFieldWithoutBorder(
                                                controller: cvvController,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                DefaultTextFormFieldWithoutBorder(
                                  controller: nameController,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          isChecked = !isChecked;
                                          PaymentCubit.get(context).changeRadioBottom(isChecked);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: primaryColor1BA,
                                          radius: 10,
                                          child: isChecked ? Icon(
                                            Icons.check,
                                            size: 15,
                                            color: primaryWhiteColor,
                                          ) : null,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Save Card Details',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Center(
                                  child: DefaultButton(
                                      function: (){
                                        navigateTo(context: context, widget: PaymentDoneScreen());
                                      },
                                      text: 'Add Card',
                                      width: 250,
                                      redius: 30
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 220,
                        decoration: BoxDecoration(
                            color: primaryColor1BA,
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(30))
                        ),
                        child: Center(
                          child: Text(
                            'PayPal',
                            style: TextStyle(
                              color: primaryWhiteColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/switchbutton.dart';

import 'Two-Step_verification._two.dart';

class TwoStepeVrification extends StatelessWidget {
  final String token;

  const TwoStepeVrification({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(name: 'Two-step verification'),
              SwitchButton(
                  name: 'Secure your account with \n two-step verification'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.lightBlue),
                      child: Image.asset('assets/images/Two-Steps/lock.png')),
                  Text(
                      "Two-step verification provides additional \n security by asking for a verification code \n every time you log in on another device.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.lightBlue),
                      child: Image.asset(
                          'assets/images/Two-Steps/external-drive.png')),
                  Text(
                      "Adding a phone number or using an \n authenticator will help keep your account \n safe from harm.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/2,),
              EndButton2(path: TwoStepVerficationTwo(), name: 'Next', color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}

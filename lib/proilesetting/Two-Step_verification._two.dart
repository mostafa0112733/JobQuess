import 'package:flutter/material.dart';
import 'package:project/proilesetting/helpcenter%20.dart';
import 'package:project/proilesetting/towstepphoneemail.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/switchbutton.dart';

import '../shapes/endbutton2.dart';

class TwoStepVerficationTwo extends StatefulWidget {
  const TwoStepVerficationTwo({super.key});

  @override
  State<TwoStepVerficationTwo> createState() => _TwoStepVerficationTwoState();
}

class _TwoStepVerficationTwoState extends State<TwoStepVerficationTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(name: 'Two-step verification'),
              SizedBox(
                height: 8,
              ),
              SwitchButton(
                name: 'Secure your account with \n two-step verification',
              ),
              SizedBox(
                height: 15,
              ),
              Text("Select a verification method",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 15,
              ),
              GoDown(name: "Telephone number (SMS)",),
              SizedBox(
                height: 15,
              ),
              Text(
                  "Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: MediaQuery.of(context).size.height/2.4,),
              EndButton2(path: TwoStepPhoneEmail(), name: 'Next', color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}

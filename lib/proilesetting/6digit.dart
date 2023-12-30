import 'package:flutter/material.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/pagetitle.dart';

import '../LOGIN/login.dart';

class SixDigit extends StatelessWidget {
  const SixDigit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(name: 'Two-step verification'),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter the 6 digit code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Please confirm your account by entering the authorization code sen to ****-****-7234",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      DigitBox(),
                      SizedBox(),
                      DigitBox(),
                      SizedBox(),
                      DigitBox(),
                      SizedBox(),
                      DigitBox(),
                      SizedBox(),
                      DigitBox(),
                      SizedBox(),
                      DigitBox(),
                      SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Resend code 42s",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  EndButton2(path: LogIn(), name: 'Verify', color: Colors.blue)
                ],
              ),
            ],
          )),
    ));
  }
}

class DigitBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

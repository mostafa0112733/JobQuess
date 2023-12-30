import 'package:flutter/material.dart';
import 'package:project/LOGIN/CheckYourEmail.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/logo.dart';

import '../shapes/LARTFF.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController emailController;
@override
  void initState() {
  emailController = TextEditingController();

  super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              Spacer(),
              Logo(
                size: 13,
              ),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text(
              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15,),
            LAGTFF(
              Controller: emailController,
              name: 'Email address',
              iconShape: Icons.email,
              isPassword: false,
              onChanged: (value) {

              },
            ),

SizedBox(height: MediaQuery.of(context).size.height/2.2,),
          EndButton2(path: checkYourEmail(), name: 'Request password reset', color: Colors.blue,),

          ],
        ),
      )),
    );
  }
}

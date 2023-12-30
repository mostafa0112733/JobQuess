import 'package:flutter/material.dart';
import 'package:project/proilesetting/6digit.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/pagetitle.dart';

class TwoStepPhoneEmail extends StatefulWidget {
  const TwoStepPhoneEmail({super.key});

  @override
  State<TwoStepPhoneEmail> createState() => _TwoStepPhoneEmailState();
}

class _TwoStepPhoneEmailState extends State<TwoStepPhoneEmail> {
  late final TextEditingController passWordController;
  late final TextEditingController emailController;

  @override
  void initState() {
    passWordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passWordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              PageTitle(name: 'Two-step verification'),
              SizedBox(
                height: 15,
              ),
              TextFormFieldWithTitle(
                  name: 'Add phone number',
                  Controller: emailController,
                  icon: Icons.email),
              SizedBox(
                height: 10,
              ),
              TextFormFieldWithTitle(
                name: 'Enter your password',
                Controller: passWordController,
                icon: Icons.lock,
              ),
              SizedBox(height: MediaQuery.of(context).size.height/2.3,),
              EndButton2(path: SixDigit(), name: 'Send Code', color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}

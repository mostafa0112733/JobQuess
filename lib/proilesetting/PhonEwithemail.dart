import 'package:flutter/material.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class PhoneWithEmail extends StatefulWidget {
  const PhoneWithEmail({super.key});

  @override
  State<PhoneWithEmail> createState() => _PhoneWithEmailState();
}

class _PhoneWithEmailState extends State<PhoneWithEmail> {
  late final TextEditingController passwordController;
  late final TextEditingController phoneController;
  late final String token;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _api() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Two-step verification'),
            TextFormFieldWithTitle(
                name: 'Add phone number', Controller: phoneController, icon: null,),
            TextFormFieldWithTitle(
                name: 'Enter your password', Controller: passwordController, icon: null,),
            EndButton(onPressed: _api, name: 'Save',color: Colors.blue,)
          ],
        ),
      )),
    );
  }
}

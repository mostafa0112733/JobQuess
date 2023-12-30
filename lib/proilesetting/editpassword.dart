import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class EditPassWord extends StatefulWidget {
  final String token;

  const EditPassWord({super.key, required this.token});

  @override
  State<EditPassWord> createState() => _EditPassWordState();
}

class _EditPassWordState extends State<EditPassWord> {
  late final TextEditingController passwordController;
  late final TextEditingController password1Controller;
  late final TextEditingController password2Controller;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    password1Controller = TextEditingController();
    password2Controller = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    password1Controller.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  Future<void> _api() async {
    if (password1Controller.text == password2Controller.text) {
      final String API = 'https://project2.amit-learning.com/api/auth/user/update';

      var response = await http.post(
        Uri.parse(API),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "password": password1Controller.text,
        }),
      );
      if (response.statusCode == 200) {
        print('Sussfull');
      }
      else {
        print('Failed to upload file. Status code: ${response.statusCode}');
      }
    }
    else {
      print('not match');
    }
  }


@override
Widget build(BuildContext context) {

  return Scaffold(
    body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              PageTitle(
                name: 'Change password',
              ),
              TextFormFieldWithTitle(
                name: 'Enter your old password',
                Controller: passwordController,
                icon: null,
              ),
              TextFormFieldWithTitle(
                name: 'Enter your new password',
                Controller: password1Controller,
                icon: null,
              ),
              TextFormFieldWithTitle(
                name: 'Confirm your new password',
                Controller: password2Controller,
                icon: null,
              ),
              EndButton(
                onPressed: _api,
                name: 'Save',
                color: Colors.blue,
              ),
            ],
          ),
        )),
  );
}}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/proilesetting/editpassword.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/switchbutton.dart';

class EditPhone extends StatefulWidget {
  final String token;
  const EditPhone({super.key, required this.token});

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
  late final TextEditingController phoneController;
  late final String token;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _api() async {
    final String API = 'https://project2.amit-learning.com/api/auth/otp';

    var response = await http.post(
      Uri.parse(API),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
        'Content-Type': 'application/json',
      },
      body: json.encode({}),
    );

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditPassWord(
                    token: token,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditPhone(
                    token: token,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [Column(
            children: [
              PageTitle(name: 'Phone number'),
              TextFormFieldWithTitle(
                name: 'Main phone number',
                Controller: phoneController, icon: null,
              ),
              SwitchButton(
                name: 'Use the phone number to reset your \n password',
              ),
              SizedBox(height: MediaQuery.of(context).size.height/2,),
              EndButton(
                onPressed: _api,
                name: 'save',
                color: Colors.blue,
              )
            ],
          ),
        ]
        ),
      )),
    );
  }
}

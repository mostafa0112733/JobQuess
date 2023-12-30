import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/proilesetting/editphone.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class EditEmail extends StatefulWidget {
  final String token;
  const EditEmail({super.key, required this.token});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  late final TextEditingController EmailController;
  late final String token;
  @override
  void initState() {
    super.initState();
    EmailController = TextEditingController();
  }

  @override
  void dispose() {
    EmailController.dispose();
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
      body: json.encode({
        "email": EmailController.text,
      }),
    );

    if (response.statusCode == 200) {
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
        child: Column(
          children: [
            PageTitle(name: 'Email address'),
            TextFormFieldWithTitle(
              name: 'Main e-mail address',
              Controller: EmailController, icon: null,
            ),
            EndButton(onPressed: _api, name: 'Save', color: Colors.blue,),
          ],
        ),
      )),
    );
  }
}

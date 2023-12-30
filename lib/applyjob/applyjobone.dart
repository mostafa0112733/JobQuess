import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/applyjob/applyjobtwo.dart';

import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class ApplyJobOne extends StatefulWidget {
  final String token;
  final String jobId;
  final String username;
  const ApplyJobOne(
      {super.key,
      required this.token,
      required this.jobId,
      required this.username});

  @override
  State<ApplyJobOne> createState() => _ApplyJobOneState();
}

class _ApplyJobOneState extends State<ApplyJobOne> {
  late final TextEditingController NameController;
  late final TextEditingController emailController;
  late final TextEditingController MobileController;
  @override
  void initState() {
    super.initState();
    NameController = TextEditingController();
    emailController = TextEditingController();
    MobileController = TextEditingController();
  }

  @override
  void dispose() {
    NameController.dispose();
    emailController.dispose();
    MobileController.dispose();
    super.dispose();
  }

  Future<void> _ProfilData() async {
    final String urlApi = 'https://project2.amit-learning.com/api/apply';

    var response = await http.post(
      Uri.parse(urlApi),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": NameController.text,
        "email": emailController.text,
        "mobile": MobileController.text,
        "jobs_id": widget.jobId,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApplyJobtwo(
                    token: widget.token, username: widget.username,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApplyJobtwo(
                    token: widget.token, username: widget.username,
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
                  PageTitle(
                    name: '"Apply Job',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        //blue circles
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/rightBlue.png',
                                    width: 44,
                                    height: 44,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Biodata",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text('2'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Type of work",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text('3'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Upload portfolio",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //title uber the text form fileds
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Biodata",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Fill in your bio data correctly",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                        // the text form fields
                        SizedBox(
                          height: 10,
                        ),
                        TextFormFieldWithTitle(
                          name: 'Full Name*',
                          Controller: NameController, icon: null,
                        ),
                        TextFormFieldWithTitle(
                          name: 'Email*',
                          Controller: emailController, icon: null,
                        ),
                        TextFormFieldWithTitle(
                          name: 'No.Handphone*',
                          Controller: MobileController, icon: null,
                        ),
                        // final button
                        EndButton(
                          onPressed: _ProfilData,
                          name: 'Save',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/applyjob/applyjobfour.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:http/http.dart' as http;

class ApplyJobtwo extends StatefulWidget {
  final String token;
  final String username;
  const ApplyJobtwo({super.key, required this.token, required this.username});

  @override
  State<ApplyJobtwo> createState() => _ApplyJobtwoState();
}

class _ApplyJobtwoState extends State<ApplyJobtwo> {
  String? selectedWork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(children: [
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
                          Text("Type of work",
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

                      FutureBuilder<List<Map<String, dynamic>>>(
                          future: _api(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              List<Map<String, dynamic>> jobs = snapshot.data!;

                              List<Widget> jobWidgets = [];

                              for (var job in jobs) {
                                String name = job['name'] ?? 'Unknown Job';

                                jobWidgets.add(Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Radio(
                                            value: name,
                                            groupValue: selectedWork,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedWork = value as String;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )));
                              }

                              return Column(
                                children: jobWidgets,
                              );
                            }
                            return Container();
                          }),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ApplyJobFour(
                                            token: widget.token,
                                            username: widget.username,
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              'Apply Now',
                              style: TextStyle(fontSize: 26),
                            ),
                          )),
                    ],
                  )),
                ]))));
  }

  Future<List<Map<String, dynamic>>> _api() async {
    final String apiUrl = "https://project2.amit-learning.com/api/jobs";

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Map<String, dynamic>> jobs =
          List<Map<String, dynamic>>.from(responseBody['data']);
      return jobs;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/Home_screen/details.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/shapes/home/mainhomeitem.dart';
import 'package:project/shapes/home/rowsbutton.dart';
import 'package:http/http.dart' as http;
import 'package:project/shapes/search.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final String token;

  const HomeScreen({Key? key, required this.userName, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Job jobs;

  Future<List<Job>> _api() async {
    final String apiUrl = "https://project2.amit-learning.com/api/jobs";

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      List<Job> jobs = List<Job>.from(
        (responseBody['data'] as List).map((job) => Job.fromJson(job)),
      );
      return jobs;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            //header
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, ${widget.userName}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Create a better future for yourself here",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                Spacer(),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/images/Icons/notification.png',
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Search(),
            SizedBox(
              height: 15,
            ),
            //header at the top of the blue contanir
            Row(
              children: [
                Text("Suggested Job",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text("View all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //blue contanir
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 53, 4, 105),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Image.asset(
                                'assets/images/camera.png',
                                width: 25,
                                height: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text("Product Designer",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Zoom • United States",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/Icons/archive-minus.png',
                        height: 35,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      RB(
                          btncolor: Color.fromARGB(255, 14, 104, 146),
                          name: "Fulltime"),
                      RB(
                          btncolor: Color.fromARGB(255, 14, 104, 146),
                          name: "Remote"),
                      RB(
                          btncolor: Color.fromARGB(255, 14, 104, 146),
                          name: "Design"),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text("\$12K-15K",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Text("/MONTH",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70)),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text("Apply now",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //title under the contanir
            Row(
              children: [
                Text("Recent Job",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                Spacer(),
                Text("View all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //home page items
            FutureBuilder<List<Job>>(
              future: _api(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Widget> mhiWidgets = [];
                  for (var job in snapshot.data!) {
                    mhiWidgets.add(
                      MHI(
                        jobs: job,
                        path: Details(
                          token: widget.token,
                          username: widget.userName,
                          jobs: job,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: mhiWidgets,
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

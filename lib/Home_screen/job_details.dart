import 'package:flutter/material.dart';
import 'package:project/shapes/home/rowsbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails>
    with SingleTickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);

  List<bool> isSelected = [
    false,
    false,
    false
  ]; // List to track the state of ToggleButtons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              PageTitle(
                name: 'Job Detail',
              ),
              Center(
                child: Column(children: [
                  Image.asset(
                    'assets/images/flags/Germany.jpg',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Senior UI Designer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Twitter • Jakarta, Indonesia ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RB(
                          btncolor: Color.fromARGB(255, 119, 186, 230),
                          name: 'Full Time'),
                      RB(
                          btncolor: Color.fromARGB(255, 119, 186, 230),
                          name: 'On Site'),
                      RB(
                          btncolor: Color.fromARGB(255, 119, 186, 230),
                          name: 'Senior')
                    ],
                  ),
                ]),
              ),
            ])),
      ),
    );
  }
}

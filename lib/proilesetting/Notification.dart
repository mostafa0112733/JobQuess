import 'package:flutter/material.dart';
import 'package:project/shapes/buttontitle.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/switchbutton.dart';

class Notifications extends StatelessWidget {
  final String token;
  const Notifications({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: PageTitle(name: 'Notification'),
          ),
          ButtonTitle(name: 'Job notification'),
          Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SwitchButton(name: 'Your Job Search Alert'),
                  SwitchButton(name: 'Job Application Update'),
                  SwitchButton(name: 'Job Application Reminders'),
                  SwitchButton(name: 'Jobs You May Be Interested In'),
                  SwitchButton(name: 'Job Seeker Updates'),
                ],
              )),
          ButtonTitle(name: 'Other notification'),
          Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SwitchButton(name: 'Show Profile'),
                  SwitchButton(name: 'All Message'),
                  SwitchButton(name: 'Message Nudges'),
                ],
              )),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/shapes/logo.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:  Column(children: [
            Row(
              children: [
                Logo(
                  size: 16,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: Text('Skip'))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/cover.png',
            ),
            Text(
              'Find a job, and start building your career from now on',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Explore over 25,924 available job roles and upgrade your operator now.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),
           
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/Home_screen/first.dart';
import 'package:project/shapes/pagetitle.dart';

class ApplyJobFour extends StatelessWidget {
  final String token;
  final String username;
  const ApplyJobFour({super.key, required this.token, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Apply Job'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 139, 187, 226),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image.asset(
                  'assets/images/successful/clipboard-tick.png',
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Your data has been \n successfully sent",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
                "You will get a message from our team, about \n the announcement of employee acceptance",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  userName: username,
                                  token: token,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: Text(
                    'Back to home',
                    style: TextStyle(fontSize: 26),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

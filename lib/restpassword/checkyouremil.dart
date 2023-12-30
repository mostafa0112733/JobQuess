import 'package:flutter/material.dart';
import 'package:project/Home_screen/first.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/restpassword/restoasswordtwo.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/pagetitle.dart';

class CheckEmil extends StatelessWidget {
  const CheckEmil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                PageTitle(name: ' '),
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
                      'assets/images/directbox-receive.png',
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Check your Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child:
                  Text("We have sent a reset password to your email address",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                EndButton2(path: RestPassWordTwo(), name: 'Open email app', color: Colors.blue),
              ],
            ),
          )),
    );
  }
}

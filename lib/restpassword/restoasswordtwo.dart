import 'package:flutter/material.dart';
import 'package:project/restpassword/passwordaccsept.dart';
import 'package:project/shapes/LARTFF.dart';
import 'package:project/shapes/logo.dart';

import '../shapes/endbutton2.dart';

class RestPassWordTwo extends StatefulWidget {
  const RestPassWordTwo({super.key});

  @override
  State<RestPassWordTwo> createState() => _RestPassWordTwoState();
}

class _RestPassWordTwoState extends State<RestPassWordTwo> {
  late final TextEditingController passwordController;
  late final TextEditingController passwordControllerTwo;
  Color buttonColor = Colors.grey;

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordControllerTwo = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordControllerTwo.dispose();

    super.dispose();
  }

  void isvalid() {
    if (passwordControllerTwo.text == passwordController.text) {
      setState(() {
        buttonColor = Colors.blue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  Logo(
                    size: 13,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Text("Create new password",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 15,
                ),
                Text("Set your new password so you can login and acces Jobsque",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                LAGTFF(
                  Controller: passwordController,
                  name: 'Enter your email....',
                  iconShape: Icons.lock,
                  isPassword: true,
                  onChanged: (value) {
                    isvalid();
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Password must be at least 8 characters",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                LAGTFF(
                  Controller: passwordControllerTwo,
                  name: 'Enter your email....',
                  iconShape: Icons.lock,
                  isPassword: true,
                  onChanged: (value) {
                    isvalid();
                  },
                ),
                SizedBox(
                  height: 8,
                ),

                Text("Both password must match",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height/3,),
                EndButton2(path: PasswordAccept(), name: 'Reset password', color: buttonColor)
              ],
            ),
          ],)

        ),
      ),
    );
  }
}

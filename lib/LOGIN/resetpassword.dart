import 'package:flutter/material.dart';
import 'package:project/LOGIN/Passwordchangedsuccesfully!.dart';
import 'package:project/shapes/endbutton2.dart';

import '../shapes/LARTFF.dart';
import '../shapes/logo.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  Color buttonColor = Colors.grey;
  late int userId;
  late final String username;

  @override
  void initState() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    userId = 1;

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create new password',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Set your new password so you can login and acces Jobsque",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                LAGTFF(
                  Controller: emailController,
                  name: '',
                  iconShape: Icons.lock,
                  isPassword: true,
                  onChanged: (value) {

                  },
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password must be at least 8 characters",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                SizedBox(height: 15),
                LAGTFF(
                  Controller: passwordController,
                  name: '',
                  iconShape: Icons.lock,
                  isPassword: true,
                  onChanged: (value) {

                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Both password must match",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height / 3.3,),
                EndButton2(path: PasswordChangedsSuccesfully(),
                  name: 'Request password reset',
                  color: Colors.blue,),

              ],
            ),
          )),
    );
  }
}

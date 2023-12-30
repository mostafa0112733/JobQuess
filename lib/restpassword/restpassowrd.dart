import 'package:flutter/material.dart';
import 'package:project/restpassword/checkyouremil.dart';
import 'package:project/restpassword/restoasswordtwo.dart';
import 'package:project/shapes/LARTFF.dart';
import 'package:project/shapes/endbutton2.dart';
import 'package:project/shapes/logo.dart';

import '../LOGIN/login.dart';

class RestPassWord extends StatefulWidget {
  const RestPassWord({super.key});

  @override
  State<RestPassWord> createState() => _RestPassWordState();
}

class _RestPassWordState extends State<RestPassWord> {
  late final TextEditingController passwordController;

  @override
  void initState() {
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void isvalid() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: ListView(
              children: [
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
                    Text("Reset Password",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                    LAGTFF(
                      Controller: passwordController,
                      name: 'Enter your email....',
                      iconShape: Icons.email,
                      isPassword: true,
                      onChanged: (value) {
                        isvalid();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You remember your password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIn()));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                )))
                      ],
                    ),
                    EndButton2(
                        path: CheckEmil(),
                        name: 'Request password reset',
                        color: Colors.blue)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

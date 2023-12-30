import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/create%20account/workinterested.dart';
import 'package:project/shapes/LARTFF.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/logo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  Color buttonColor = Colors.grey;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void isvalid() {
    if (userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      setState(() {
        buttonColor = Colors.blue;
      });
    }
  }

  Future<void> _signup() async {
    String apiUrl = 'https://project2.amit-learning.com/api/auth/register';

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "name": userNameController.text,
        "password": passwordController.text,
      }),
    );
    if (response.statusCode == 200) {
      print("Signup successful!");
      print(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => Workinterested(),));
          } else {
      print("Signup failed!");
      print(response.statusCode);
      print(response.body);
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
              height: 20,
            ),
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please create an account to find your dream job',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            LAGTFF(
              Controller: userNameController,
              name: 'UserName',
              iconShape: Icons.person,
              isPassword: false,
              onChanged: (value) {
                isvalid();
              },
            ),
            SizedBox(
              height: 15,
            ),
            LAGTFF(
              Controller: emailController,
              name: 'Email',
              iconShape: Icons.email,
              isPassword: false,
              onChanged: (value) {
                isvalid();
              },
            ),
            SizedBox(
              height: 15,
            ),
            LAGTFF(
              Controller: passwordController,
              name: 'password',
              iconShape: Icons.password,
              isPassword: true,
              onChanged: (value) {
                isvalid();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Password must be at least 8 characters',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    ' Sign In',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            EndButton(
              onPressed: _signup,
              name: 'Sign Up',
              color: buttonColor,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Or Sign up With Account',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/LOGIN/forget_passwor.dart';
import 'package:project/create%20account/signup.dart';
import 'package:http/http.dart' as http;
import 'package:project/provider/userprovider.dart';

import 'package:project/shapes/LARTFF.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/toggle.dart';
import 'package:provider/provider.dart';


class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: _LogInWidget(),
    );
  }
}

class _LogInWidget extends StatefulWidget {
  const _LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<_LogInWidget> {
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

  void isvalid() {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      setState(() {
        buttonColor = Colors.blue;
      });
    } else {
      setState(() {
        buttonColor = Colors.grey;
      });
    }
  }

  Future<void> _login() async {
    try {
      String apiUrl = 'https://project2.amit-learning.com/api/auth/login';

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String token = jsonResponse['token'];
        final Map<String, dynamic> responseData = json.decode(response.body);
        userId = responseData['user']['id'];
        username = responseData['user']['name'];
        context.read<AuthProvider>().setToken(token, userId, username);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Togglebutton(
              token: token,
              user: username,
              user_id: userId,
            ),
          ),
        );
      } else {
        print("Sign in failed!");
        print("Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (error) {
      print("Error during login: $error");
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "J",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 14,
                  ),
                  Text(
                    'BSQUE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: 100),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please login to find your dream job',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              LAGTFF(
                Controller: emailController,
                name: 'Email ',
                iconShape: Icons.person,
                isPassword: false,
                onChanged: (value) {
                  isvalid();
                },
              ),
              LAGTFF(
                Controller: passwordController,
                name: 'PassWord',
                iconShape: Icons.lock,
                isPassword: true,
                onChanged: (value) {
                  isvalid();
                },
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {},
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text('Forget password',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont’t have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      " Register",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              EndButton(
                onPressed: _login,
                name: 'Login',
                color: buttonColor,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Login With Account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

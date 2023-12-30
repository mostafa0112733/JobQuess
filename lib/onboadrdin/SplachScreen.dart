import 'package:flutter/material.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/shapes/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    _checkFirstTime().then((isFirstTime) {
      if (isFirstTime) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return OnBoarding();
        }));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return LogIn();
        }));
      }
    });

    return Scaffold(
      body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Logo(
              size: 28,
            ),
          ),
        ],
      )),
    );
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }
}

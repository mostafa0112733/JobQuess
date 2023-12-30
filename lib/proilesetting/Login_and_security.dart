import 'package:flutter/material.dart';
import 'package:project/proilesetting/Two_step_verification.dart';
import 'package:project/proilesetting/edit_email.dart';
import 'package:project/proilesetting/editpassword.dart';
import 'package:project/proilesetting/editphone.dart';
import 'package:project/shapes/buttontitle.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/profilbutoons2.dart';

class LoginAndSecurity extends StatefulWidget {
  final String token;
  const LoginAndSecurity({super.key, required this.token});

  @override
  State<LoginAndSecurity> createState() => _LoginAndSecurityState();
}

class _LoginAndSecurityState extends State<LoginAndSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Accont access'),
          ],
        ),
      ),
      ButtonTitle(
        name: 'Accont access',
      ),
      Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ProfileBittons2(
                token: widget.token,
                name: "Email address",
                pageBuilder: (token) => EditEmail(token: token),
              ),
            ),
            SizedBox(
              height: 60,
              child: ProfileBittons2(
                token: widget.token,
                name: "Phone number",
                pageBuilder: (token) => EditPhone(token: token),
              ),
            ),
            SizedBox(
              height: 60,
              child: ProfileBittons2(
                token: widget.token,
                name: "Change password",
                pageBuilder: (token) => EditPassWord(token: token),
              ),
            ),
            SizedBox(
              height: 60,
              child: ProfileBittons2(
                token: widget.token,
                name: "Two-step verification",
                pageBuilder: (token) => TwoStepeVrification(token: token),
              ),
            ),
            SizedBox(
              height: 60,
              child: ProfileBittons2(
                token: widget.token,
                name: "Face ID",
                pageBuilder: (token) => TwoStepeVrification(token: token),
              ),
            ),
          ],
        ),
      )
    ])));
  }
}

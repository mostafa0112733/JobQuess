
import 'package:flutter/material.dart';
import 'package:project/proilesetting/Login_and_security.dart';
import 'package:project/proilesetting/Portfolio.dart';
import 'package:project/proilesetting/Notification.dart';

import 'package:project/proilesetting/editprofil.dart';
import 'package:project/proilesetting/language.dart';
import 'package:project/proilesetting/privacypolicy.dart';
import 'package:project/proilesetting/terms&conditions.dart';
import 'package:project/shapes/buttontitle.dart';
import 'package:project/shapes/profilbutonns.dart';
import 'package:project/shapes/profilbutoons2.dart';

import 'helpcenter .dart';

class Profil extends StatefulWidget {
  final String token;
  final String name;

  const Profil({super.key, required this.token, required this.name});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.lightBlue,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text('Senior UI/UX Designer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('applied',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('51',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 44,
                          width: 1,
                          color: Colors.black,
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('applied',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('51',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 44,
                          width: 1,
                          color: Colors.black,
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('applied',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('51',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("About",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text("Edit",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )))
                      ],
                    ),
                    Text(
                        "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
              ButtonTitle(
                name: 'General',
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    ProfilButtons(
                      token: widget.token,
                      image: 'assets/images/profil/frame.png',
                      name: 'Edit Profile',
                      pageBuilder: (token) => EditProfil(token: token),
                    ),
                    ProfilButtons(
                      token: widget.token,
                      image: 'assets/images/profil/folder-favorite.png',
                      name: "Portfolio",
                      pageBuilder: (token) => Portfolio(token: token),
                    ),
                    ProfilButtons(
                      token: widget.token,
                      image: 'assets/images/profil/global.png',
                      name: "Langauge",
                      pageBuilder: (token) => Languge(token: token),
                    ),
                    ProfilButtons(
                      token: widget.token,
                      image: 'assets/images/profil/notification.png',
                      name: "Notification",
                      pageBuilder: (token) => Notifications(token: token),
                    ),
                    ProfilButtons(
                      token: widget.token,
                      image: 'assets/images/profil/lock.png',
                      name: "Login and security",
                      pageBuilder: (token) => LoginAndSecurity(token: token),
                    ),
                  ],
                ),
              ),
              ButtonTitle(
                name: 'Others',
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    ProfileBittons2(
                      token: widget.token,
                      name: "Accesibility",
                      pageBuilder: (token) => EditProfil(token: token),
                    ),
                    ProfileBittons2(
                      token: widget.token,
                      name: "Help Center",
                      pageBuilder: (token) => HelpCenter(token: token),
                    ),
                    ProfileBittons2(
                      token: widget.token,
                      name: "Terms & Conditions",
                      pageBuilder: (token) => TermsConditions(token: token),
                    ),
                    ProfileBittons2(
                      token: widget.token,
                      name: "Privacy Policy",
                      pageBuilder: (token) => PrivacyPolicy(token: token),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}

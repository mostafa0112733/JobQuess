import 'package:flutter/material.dart';
import 'package:project/Home_screen/first.dart';
import 'package:project/appledjob/appledjob.dart';

import 'package:project/proilesetting/profill.dart';
import 'package:project/save.dart';

import 'chats/home_chat.dart';

class Togglebutton extends StatefulWidget {
  final String token;
  final int user_id;
  final String user;

  const Togglebutton(
      {super.key,
      required this.token,
      required this.user,
      required this.user_id});

  @override
  State<Togglebutton> createState() => _TogglebuttonState();
}

class _TogglebuttonState extends State<Togglebutton> {
  int _selectedIndex = 0;
  late final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                HomeScreen(
                  userName: widget.user,
                  token: widget.token,
                ),
                HomeChat(),
                AppledJob(),
                Saved(),
                Profil(
                  token: widget.token,
                  name: widget.user,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ToggleButtons(
                children: [
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    ),
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Text('Home'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    ),
                    Icon(
                      Icons.message,
                      size: 30,
                    ),
                    Text('Message'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    ),
                    Icon(
                      Icons.badge,
                      size: 30,
                    ),
                    Text('Applied'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    ),
                    Icon(
                      Icons.save,
                      size: 30,
                    ),
                    Text('Saved'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.3,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    Text('Profile'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                    )
                  ]),
                ],
                isSelected: [
                  _selectedIndex == 0,
                  _selectedIndex == 1,
                  _selectedIndex == 2,
                  _selectedIndex == 3,
                  _selectedIndex == 4,
                ],
                onPressed: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

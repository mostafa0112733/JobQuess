import 'package:flutter/material.dart';
import 'package:project/create%20account/Location.dart';
import 'package:project/shapes/boxes.dart';
import 'package:project/shapes/endbutton2.dart';


class Workinterested extends StatefulWidget {
  const Workinterested({super.key});

  @override
  State<Workinterested> createState() => _WorkinterestedState();
}

class _WorkinterestedState extends State<Workinterested> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                'What type of work are you interested in?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Tell us what you’re interested in so we can customise the app for your needs.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Boxes(
                  img: 'assets/images/Workinterested/bezier.png',
                  name: 'UI/UX Designer',
                ),
                SizedBox(
                  width: 10,
                ),
                Boxes(
                  img: 'assets/images/Workinterested/pen-tool-2.png',
                  name: 'Ilustrator Designer',
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Row(children: [
                Boxes(
                  img: 'assets/images/Workinterested/code.png',
                  name: 'Developer',
                ),
                SizedBox(
                  width: 10,
                ),
                Boxes(
                  img: 'assets/images/Workinterested/graph.png',
                  name: 'Management',
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Row(children: [
                Boxes(
                  img: 'assets/images/Workinterested/monitor-mobbile.png',
                  name: 'Information Technology',
                ),
                SizedBox(
                  width: 10,
                ),
                Boxes(
                  img: 'assets/images/Workinterested/cloud-add.png',
                  name: 'Research and Analytics',
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              EndButton2(path: Location(), name: 'Next', color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}

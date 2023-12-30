import 'package:flutter/material.dart';
import 'package:project/shapes/endbutton2.dart';

import 'accepts.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'Where is your preferred location?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Let us know where the work location you prefer at this time, so we can adjust accordingly.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  CountryContainer(name: 'Egypt'),
                  CountryContainer(name: 'China'),
                  CountryContainer(name: 'America'),
                  CountryContainer(name: 'Germany'),
                  CountryContainer(name: 'Soudi'),
                  CountryContainer(name: 'Libnan'),
                  CountryContainer(name: 'Qater'),
                  CountryContainer(name: 'Libya'),
                  CountryContainer(name: 'Soudan'),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/2.4,),
              EndButton2(path: Accept(), name: 'Next', color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}
class CountryContainer extends StatefulWidget {
  final String name;

  const CountryContainer({Key? key, required this.name}) : super(key: key);

  @override
  State<CountryContainer> createState() => _CountryContainerState();
}

class _CountryContainerState extends State<CountryContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Set the fixed width
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: _isPressed ? Colors.blueAccent : Colors.white10,
          onPrimary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ButtonTitle extends StatelessWidget {
  final String name;
  const ButtonTitle({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 223, 237, 237),
      height: 30,
      padding: EdgeInsets.fromLTRB(30, 8, 0, 0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

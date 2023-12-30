import 'package:flutter/material.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final String name;
  final TextEditingController Controller;
  final IconData? icon;
  const TextFormFieldWithTitle(
      {super.key, required this.name, required this.Controller,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
      TextFormField(
        controller: Controller,

        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: name,
          labelStyle: TextStyle(color: Colors.black), // Label text color
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 60,
      ),
    ]);
  }
}

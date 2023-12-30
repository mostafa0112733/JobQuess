import 'package:flutter/material.dart';

class LAGTFF extends StatefulWidget {
  final TextEditingController Controller;
  final String name;
  final IconData iconShape;
  final bool isPassword;
  final Function(String) onChanged;

  LAGTFF({
    super.key,
    required this.Controller,
    required this.name,
    required this.iconShape,
    required this.isPassword,
    required this.onChanged,
  });

  @override
  State<LAGTFF> createState() => _LAGTFFState();
}

class _LAGTFFState extends State<LAGTFF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      child: TextFormField(
        obscureText: widget.isPassword,
        controller: widget.Controller,
        onChanged: widget.onChanged,

        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.iconShape,
            color: Colors.blue,
          ),
          labelText: widget.name,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BoxWrap extends StatefulWidget {
  final String name;
  const BoxWrap({super.key, required this.name});

  @override
  State<BoxWrap> createState() => _BoxWrapState();
}

class _BoxWrapState extends State<BoxWrap> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: _isPressed ? Colors.blue : Colors.white,
      child: Text(
        widget.name,
        style: TextStyle(color: _isPressed ? Colors.blue : Colors.white),
      ),
    );
  }
}

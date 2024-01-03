import 'package:flutter/material.dart';

class Boxes extends StatefulWidget {
  const Boxes({super.key, required this.img, required this.name});

  final String img;
  final String name;

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 3.4,
      width: MediaQuery.of(context).size.width / 2.3,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          style: ElevatedButton.styleFrom(
              primary: _isPressed
                  ? Colors.blueAccent
                  : Colors.white, // Background color
              onPrimary: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))
              // Text color
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white30,
                ),
                child: Image.asset(
                  widget.img,
                  color: _isPressed ? Colors.white : Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: _isPressed ? Colors.white : Colors.blue,
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

class EndButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final String name;
  final Color color;

   EndButton({Key? key, required this.onPressed, required this.name,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          onPressed(); // Invoke the provided function
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

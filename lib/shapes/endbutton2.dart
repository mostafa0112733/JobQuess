import 'package:flutter/material.dart';

class EndButton2 extends StatelessWidget {
  final String name;
  final Color color;
  final Widget path;

  EndButton2(
      {Key? key, required this.path, required this.name, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => path));
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

import 'package:flutter/material.dart';

class RB extends StatelessWidget {
  final String name;
  final Color btncolor;

  const RB({super.key, required this.btncolor, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: btncolor,
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(name,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            )),
        SizedBox(
          width: 10,
        )
      ]),
    );
  }
}

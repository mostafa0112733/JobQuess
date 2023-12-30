import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final Color color;
  final String text;
  final MainAxisAlignment position;
  const ChatBox(
      {super.key,
      required this.color,
      required this.text,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: position, children: [
      IntrinsicWidth(
        child: Container(
          color: color,
          width: MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("10.18",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      )
    ]);
  }
}

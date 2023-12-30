import 'package:flutter/material.dart';

import '../chats/chat.dart';

class MCI extends StatelessWidget {
  final String name;
  final String imgs;
  final String text;


  const MCI({
    Key? key,
    required this.name,
    required this.imgs,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Use Navigator.push to navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(), // Replace NextScreen with your desired screen
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Set the button background color
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imgs,
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:project/shapes/chatbox.dart';
import 'package:project/shapes/pagetitle.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Twitter'),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text('Today,  Nov 13'),
            ),
            ChatBox(
              color: Colors.white70,
              text:
                  "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
              position: MainAxisAlignment.start,
            ),
            SizedBox(
              height: 8,
            ),
            ChatBox(
              color: Colors.blue,
              text:
                  "Hi Melan, thank you for considering me, this is good news for me.",
              position: MainAxisAlignment.end,
            ),
            ChatBox(
              color: Colors.white70,
              text:
                  "Can we have an interview via google meet call today at 3pm?",
              position: MainAxisAlignment.start,
            ),
            ChatBox(
              color: Colors.blue,
              text: "Of course, I can!",
              position: MainAxisAlignment.end,
            ),
            ChatBox(
              color: Colors.white70,
              text:
                  "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!https://meet.google.com/dis-sxdu-ave",
              position: MainAxisAlignment.start,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "write a message",
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Set border radius here
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

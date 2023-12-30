import 'package:flutter/material.dart';
import 'package:project/shapes/MCI.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/search.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Message'),
            SizedBox(
              height: 10,
            ),
            Search(),
            SizedBox(
              height: 10,
            ),
            MCI(
                name: 'twittwr',
                imgs: 'assets/images/chat/Twitter Logo.png',
                text: 'Here is the link: http://zoom.com/abcdeefg'),
            MCI(
                name: 'Gojek Indonesia',
                imgs: 'assets/images/chat/Gojek Logo.png',
                text: 'Let’s keep in touch.'),
            MCI(
                name: 'Shoope',
                imgs: 'assets/images/chat/Shoope Logo.png',
                text: 'Thank You David!'),
            MCI(
                name: 'Dana',
                imgs: 'assets/images/chat/Slack Logo.png',
                text: 'Thank you for your attention!'),
            MCI(
                name: 'Facebook',
                imgs: 'assets/images/chat/Facebook Logo.png',
                text: 'You: What about the interview stage?'),
          ],
        ),
      )),
    );
  }
}

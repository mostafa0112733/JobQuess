import 'package:flutter/material.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/shapes/logo.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Logo(size: 16),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: Text('skip'))
              ],
            ),
            Image.asset(
              'assets/images/person.png',
            ),
            Text(
              "Get the best choice for the job you've always dreamed of",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Immediately join us and start applying for the job you are interested in.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 50,
            ),
           
          ]),
    ));
  }
}

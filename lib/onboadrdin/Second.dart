import 'package:flutter/material.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/shapes/logo.dart';

class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:Column(children: [
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
              'assets/images/twopersons.png',
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'Hundreds of jobs are waiting',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(children: [
              Text(
                'for you to',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' join together',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ]),
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

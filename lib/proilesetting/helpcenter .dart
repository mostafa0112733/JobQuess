import 'package:flutter/material.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:project/shapes/search.dart';

class HelpCenter extends StatelessWidget {
  final String token;
  const HelpCenter({super.key,required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(name: 'Help Center '),
              SizedBox(
                height: 8,
              ),
              Search(),
              SizedBox(
                height: 12,
              ),
              Text("Lorem ipsum dolor sit amet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
              SizedBox(
                height: 15,
              ),
              GoDown( name: 'Lorem ipsum dolor sit amet',),
            ],
          ),
        ),
      ),
    );
  }
}
class GoDown extends StatelessWidget {
  final String name;
  const GoDown({Key? key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          SizedBox(height: 4), // Add some spacing between text and icon
          Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }
}


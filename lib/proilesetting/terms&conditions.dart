import 'package:flutter/material.dart';
import 'package:project/shapes/pagetitle.dart';

class TermsConditions extends StatelessWidget {
  final String token;

  const TermsConditions({super.key,required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(name: 'Terms & Conditions'),
              SizedBox(height: 10),
              Text("Lorem ipsum dolor",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 10),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              Text("Lorem ipsum dolor",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 10),
              Text(
                  "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 10),
              Text(
                  "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 10),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

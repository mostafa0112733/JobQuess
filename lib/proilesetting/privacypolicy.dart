import 'package:flutter/material.dart';
import 'package:project/shapes/pagetitle.dart';

class PrivacyPolicy extends StatelessWidget {
  final String token;

  const PrivacyPolicy({super.key,required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(name: 'Privacy Policy'),
              SizedBox(
                height: 10,
              ),
              Text("Your privacy is important",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("Data controllers and contract partners",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
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

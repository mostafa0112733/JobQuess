// cart_page.dart
import 'package:flutter/material.dart';
import 'package:project/chats/chat.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/models/savedModel.dart';
import 'package:project/shapes/home/mainhomeitem.dart';
import 'package:provider/provider.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Job> cartItems = Provider.of<SavedModel>(context).savedItems;

    return Scaffold(

      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          Job job = cartItems[index];
          return MHI(
            jobs: job,
            path: Chat(), // Replace Chat() with the desired destination
          );
        },
      ),
    );
  }
}

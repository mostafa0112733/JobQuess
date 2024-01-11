import 'package:flutter/material.dart';
import 'package:project/Home_screen/details.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/models/savedModel.dart';
import 'package:project/provider/userprovider.dart';
import 'package:project/shapes/home/mainhomeitem.dart';
import 'package:provider/provider.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Consumer<AuthProvider>(
          builder: (context, user, _) {
            List<Job> cartItems = Provider.of<SavedModel>(context).savedItems;
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Job job = cartItems[index];
                return MHI(
                  jobs: job,
                  path: Details(
                    jobs: job,
                    username: user.username,
                    token: user.token,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

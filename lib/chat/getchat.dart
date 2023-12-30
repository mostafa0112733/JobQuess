import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetChat extends StatefulWidget {
  final String token;
  const GetChat({super.key, required this.token});

  @override
  State<GetChat> createState() => _GetChatState();
}

class _GetChatState extends State<GetChat> {
  var comp_id;
  var user_id;
  Future<void> _GetApi() async {
    final String url = 'https://project2.amit-learning.com/api/chat?user_id=1&comp_id=1';
    var response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer ${widget.token}'},
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      user_id = data['user_id'].toString();
      comp_id = data['comp_id'].toString();
      print(user_id);
      print(comp_id);
    } else {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: _GetApi, child: Text('data')),
      ),
    );
  }
}

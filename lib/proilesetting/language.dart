import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/shapes/pagetitle.dart';

class Languge extends StatefulWidget {
  final String token;
  const Languge({Key? key, required this.token}) : super(key: key);

  @override
  State<Languge> createState() => _LangugeState();
}

class _LangugeState extends State<Languge> {
  String? selectedLanguage;

  Future<void> _ApiLanguge() async {
    final String Api =
        'https://project2.amit-learning.com/api/user/profile/edit';

    var response = await http.put(Uri.parse(Api),
        headers: {'Authorization': 'Bearer ${widget.token}'},
        body: jsonEncode({"language": selectedLanguage}));
    if (response.statusCode == 200) {
      print('add');
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            PageTitle(
              name: 'Languge',
            ),
            buildLanguageRow('assets/images/flags/England.jpg', 'English'),
            buildLanguageRow('assets/images/flags/Indonesia.jpg', 'Indonesia'),
            buildLanguageRow('assets/images/flags/Saudi Arabia.jpg', 'Arabic'),
            buildLanguageRow('assets/images/flags/China.jpg', 'Chinese'),
            buildLanguageRow('assets/images/flags/Netherlands.jpg', 'Dutch'),
            buildLanguageRow('assets/images/flags/France.jpg', 'French'),
            buildLanguageRow('assets/images/flags/Germany.jpg', 'German'),
            buildLanguageRow('assets/images/flags/Japan.jpg', 'Japanese'),
            buildLanguageRow('assets/images/flags/South Korea.jpg', 'Korean'),
            buildLanguageRow('assets/images/flags/Portugal.jpg', 'Portuguese'),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _ApiLanguge,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildLanguageRow(String imagePath, String language) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(width: 8),
          Text(language),
          Spacer(),
          Radio(
            value: language,
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value as String;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/proilesetting/language.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';

class Portfolio extends StatefulWidget {
  final String token;

  const Portfolio({Key? key, required this.token}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  File? selectedFile;

  Future<void> _PostCv() async {
    final String urlApi =
        'https://project2.amit-learning.com/api/user/profile/portofolios';

    if (selectedFile != null) {
      try {
        List<int> fileBytes = await selectedFile!.readAsBytes();

        String base64File = base64Encode(fileBytes);

        var response = await http.post(Uri.parse(urlApi),
            headers: {
              'Authorization': 'Bearer ${widget.token}',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'cv_file': base64File}));

        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Languge(
                        token: widget.token,
                      )));
        } else {
          // Handle error, you may want to show a snackbar or an alert dialog
          print("Error uploading file. Status code: ${response.statusCode}");
        }
      } catch (e) {
        print("Error uploading file: $e");
      }
    } else {
      print("No file selected");
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
              Column(
                children: [
                  PageTitle(
                    name: 'Portfolio',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Add portfolio here',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 152, 171, 225),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        selectedFile != null
                            ? Column(
                                children: [
                                  Image.asset(
                                    'assets/images/document-upload.png',
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                  ),
                                  Text(
                                    'Selected file:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    selectedFile!.path.split('/').last,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Image.asset(
                                    'assets/images/document-upload.png',
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                  ),
                                  Text(
                                    'Upload your file',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Max. file size 10 MB',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                // Open the file picker to get any type of file
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  setState(() {
                                    selectedFile =
                                        File(result.files.single.path!);
                                  });
                                  print("Selected file: ${selectedFile!.path}");
                                } else {
                                  print("File picking canceled.");
                                }
                              } catch (e) {
                                print("Error picking file: $e");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 152, 171, 225),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.file_upload),
                                SizedBox(width: 8),
                                Text(
                                  selectedFile != null
                                      ? selectedFile!.path.split('/').last
                                      : "Add file",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.8,
                  ),
                  EndButton(
                      onPressed: _PostCv, name: 'Save', color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/endbutton.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:http/http.dart' as http;

class Experience extends StatefulWidget {
  final String token;
  final int user_id;

  const Experience({super.key, required this.token, required this.user_id});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  late final TextEditingController experienceController;
  late final TextEditingController typeOfWorksController;
  late final TextEditingController companyNameController;
  late final TextEditingController locationController;
  late final TextEditingController startController;
  late final TextEditingController endController;
  int? id;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    super.initState();
    experienceController = TextEditingController();
    typeOfWorksController = TextEditingController();
    companyNameController = TextEditingController();
    locationController = TextEditingController();
    startController = TextEditingController(
      text: _selectedStartDate != null
          ? DateFormat('yyyy-MM-dd').format(_selectedStartDate!)
          : '',
    );
    endController = TextEditingController(
      text: _selectedStartDate != null
          ? DateFormat('yyyy-MM-dd').format(_selectedStartDate!)
          : '',
    );
  }

  @override
  void dispose() {
    experienceController.dispose();
    typeOfWorksController.dispose();
    companyNameController.dispose();
    locationController.dispose();
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
      });
    }
  }

  Future<void> _api() async {
    if (experienceController.text.isNotEmpty ||
        typeOfWorksController.text.isNotEmpty ||
        companyNameController.text.isNotEmpty ||
        locationController.text.isNotEmpty||
        startController.text.isNotEmpty) {
      final String apiUrl = "https://project2.amit-learning.com/api/experince";

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
        },
        body: jsonEncode({
          'user_id':widget.user_id.toString(),
          'postion': experienceController.toString(),
          'type_work': typeOfWorksController.toString(),
          'comp_name': companyNameController.toString(),
          'location': locationController.toString(),
          'start': startController.toString(),
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response body to get the ID
        Map<String, dynamic> responseData = jsonDecode(response.body);
         id = responseData['data']['id'];

        print('Data posted successfully. ID: $id');
      } else {
        print('Failed to post data: ${response.statusCode}');
      }
    }
    if (endController != null) {
      final String apiUrl = "https://project2.amit-learning.com/api/experince/${id}";

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
        },
        body: jsonEncode({
          'end': endController.toString(),
        }),
      );

      if (response.statusCode == 200) {
        print('Data posted successfully');
      } else {
        print('Failed to post data: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(children: [
            Column(
              children: [
                PageTitle(name: 'Experience'),
                Text(widget.user_id.toString()),
                TextFormFieldWithTitle(
                  name: 'Position ',
                  Controller: experienceController,
                  icon: null,
                ),
                TextFormFieldWithTitle(
                  name: 'Type of work ',
                  Controller: typeOfWorksController,
                  icon: null,
                ),
                TextFormFieldWithTitle(
                  name: 'Company name * ',
                  Controller: companyNameController,
                  icon: null,
                ),
                TextFormFieldWithTitle(
                  name: 'Location * ',
                  Controller: locationController,
                  icon: null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Start Year',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectStartDate(context),
                    ),
                  ),
                  readOnly: true,
                  controller: startController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'End Year',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectEndDate(context),
                      ),
                    ),
                    readOnly: true,
                    controller: endController),
                SizedBox(
                  height: 20,
                ),
                EndButton(onPressed: _api, name: 'save', color: Colors.blue)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

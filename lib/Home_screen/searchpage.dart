import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Home_screen/details.dart';
import 'package:project/Home_screen/searchnotfound.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/shapes/home/mainhomeitem.dart';
import 'package:project/shapes/home/modelbutton.dart';
import 'package:project/shapes/home/serch.dart';

class SearchPage extends StatefulWidget {
  final String token;
  final String userName;

  const SearchPage({Key? key, required this.token, required this.userName})
      : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController nameController;
  late final TextEditingController locationController;
  late final TextEditingController salaryController;

  List<Job> allJobs = [];
  List<Job> searchResults = [];

  void initState() {
    super.initState();
    nameController = TextEditingController();
    locationController = TextEditingController();
    salaryController = TextEditingController();
  }

  Future<List<Job>> _api() async {
    final String apiUrl = "https://project2.amit-learning.com/api/jobs";

    if (nameController.text.isNotEmpty ||
        locationController.text.isNotEmpty ||
        salaryController.text.isNotEmpty) {

      final String filterApiUrl =
          "https://project2.amit-learning.com/api/jobs/filter";

      var response = await http.post(
        Uri.parse(filterApiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': nameController.text,
          'location': locationController.text,
          'salary': salaryController.text,
        }),
      );

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        List<Job> jobs = List<Job>.from(
          (responseBody['data'] as List).map((job) => Job.fromJson(job)),
        );
        return jobs;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } else {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
        },
      );

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        List<Job> jobs = List<Job>.from(
          (responseBody['data'] as List).map((job) => Job.fromJson(job)),
        );
        return jobs;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }
  }

  void performSearch(String query) {
    setState(() {
      searchResults = allJobs
          .where((job) =>
              job.name.contains(query) ||
              job.aboutCompany.contains(query) ||
              job.salary.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Searchh(
              onSearch: performSearch,
              token: widget.token,
              userName: widget.userName,
            ),
            Row(
              children: [
                ModelBottom(
                  onFilterPressed: (name, location, salary) {
                    setState(() {
                      nameController.text = name;
                      locationController.text = location;
                      salaryController.text = salary;
                    });
                  },
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                DropDown(
                  Option1: 'Remote',
                  Option2: 'On Site',
                  Option3: 'Hyprid',
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                DropDown(
                  Option1: 'Any',
                  Option2: 'Part Time',
                  Option3: 'Full Time',
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                DropDown(
                  Option1: 'Any',
                  Option2: 'Part Time',
                  Option3: 'Full Time',
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            FutureBuilder<List<Job>>(
              future: _api(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Job> allJobs = snapshot.data ?? [];

                  if (allJobs.isEmpty) {
                    print("Displaying SearchNotFound");
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                        ),
                        SearchNotFound(),
                      ],
                    );
                  } else {
                    List<Widget> mhiWidgets = [];
                    for (var job
                        in searchResults.isNotEmpty ? searchResults : allJobs) {
                      mhiWidgets.add(
                        MHI(
                          jobs: job,
                          path: Details(
                            token: widget.token,
                            username: widget.userName,
                            jobs: job,
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: mhiWidgets,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final String Option1;
  final String Option2;
  final String Option3;
  const DropDown(
      {Key? key,
      required this.Option1,
      required this.Option2,
      required this.Option3})
      : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String selectedValue; // Initial value

  @override
  void initState() {
    super.initState();
    selectedValue = widget.Option1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedValue = newValue;
            });
          }
        },
        items: <String>[widget.Option1, widget.Option2, widget.Option3]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        dropdownColor: Colors.blue, // Dropdown background color
        icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Dropdown icon
        style: TextStyle(color: Colors.white), // Dropdown text style
      ),
    );
  }
}

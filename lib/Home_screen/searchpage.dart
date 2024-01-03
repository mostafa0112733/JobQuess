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

    // Check if search parameters are not empty
    if (nameController.text.isNotEmpty ||
        locationController.text.isNotEmpty ||
        salaryController.text.isNotEmpty) {
      // If any of the search parameters is not empty, update the API endpoint
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
      // If search parameters are empty, fetch data from the default endpoint
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
              job.name.toLowerCase().contains(query.toLowerCase()) ||
              job.aboutCompany.toLowerCase().contains(query.toLowerCase()) ||
              job.salary.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Searchh(
            onSearch: performSearch,
            token: widget.token,
            userName: widget.userName,
          ),
          ModelBottom(
            onFilterPressed: (name, location, salary) {
              setState(() {
                nameController.text = name;
                locationController.text = location;
                salaryController.text = salary;
              });
            },
          ),
          FutureBuilder<List<Job>>(
            future: _api(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<Job> allJobs = snapshot.data ?? [];

                print("Number of jobs: ${allJobs.length}");

                if (allJobs.isEmpty) {
                  // Display SearchNotFound widget if no data is available
                  print("Displaying SearchNotFound");
                  return SearchNotFound();
                }

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
            },
          ),
        ],
      ),
    );
  }
}

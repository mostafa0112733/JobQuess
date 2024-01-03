import 'package:flutter/material.dart';
import 'package:project/create%20account/Location.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/pagetitle.dart';

class ModelBottom extends StatefulWidget {
  final Function(String, String, String) onFilterPressed;

  const ModelBottom({Key? key, required this.onFilterPressed}) : super(key: key);

  @override
  State<ModelBottom> createState() => _ModelBottomState();
}

class _ModelBottomState extends State<ModelBottom> {
  late final TextEditingController nameController;
  late final TextEditingController locationController;
  late final TextEditingController salaryController;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    locationController = TextEditingController();
    salaryController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Modal BottomSheet'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    PageTitle(
                      name: 'Set Filter',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFieldWithTitle(
                      name: 'Job Title',
                      Controller: nameController,
                      icon: null,
                    ),
                    TextFormFieldWithTitle(
                      name: 'Location',
                      Controller: locationController,
                      icon: null,
                    ),
                    TextFormFieldWithTitle(
                      name: 'Salary',
                      Controller: salaryController,
                      icon: null,
                    ),
                    Text("Job Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        CountryContainer(
                          name: 'Full time',
                        ),
                        Spacer(),
                        CountryContainer(
                          name: 'Remote',
                        ),
                        Spacer(),
                        CountryContainer(
                          name: 'Contract',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CountryContainer(
                          name: 'Part Time',
                        ),
                        Spacer(),
                        CountryContainer(
                          name: 'Onsite',
                        ),
                        Spacer(),
                        CountryContainer(
                          name: 'Internship',
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Pass the values to the callback
                        widget.onFilterPressed(
                          nameController.text,
                          locationController.text,
                          salaryController.text,
                        );
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: const Text('Filter'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

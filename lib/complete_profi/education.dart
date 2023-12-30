import 'package:flutter/material.dart';
// import 'package:project/complete%20profile/Experience.dart';
// import 'package:project/complete%20profile/personaldetails.dart';
import 'package:project/complete_profi/expeince.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/pagetitle.dart';
import 'package:intl/intl.dart';

class Education extends StatefulWidget {
  final String token;
  final int user_id;
  const Education({super.key, required this.token,required this.user_id});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  late final TextEditingController _universityController;
  late final TextEditingController _titleController;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  @override
  void initState() {
    super.initState();
    _universityController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _universityController.dispose();
    _titleController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20),
              PageTitle(name: 'Education'),
              TextFormFieldWithTitle(
                name: 'University',
                Controller: _universityController, icon: null,
              ),
              TextFormFieldWithTitle(
                name: 'Title',
                Controller: _titleController, icon: null,
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
                controller: TextEditingController(
                  text: _selectedStartDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedStartDate!)
                      : '',
                ),
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
                controller: TextEditingController(
                  text: _selectedEndDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedEndDate!)
                      : '',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Experience(token: widget.token, user_id: widget.user_id,)));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 26),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

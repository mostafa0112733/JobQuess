import 'package:flutter/material.dart';
import 'package:project/shapes/switchbutton.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? dropDownButton;
  String? newValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SwitchButton(
                name: 'Secure your account with two-step verification'),
            Text("Select a verification method",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            DropdownButton(
              onChanged: (newValue) {
                setState(() {
                  dropDownButton = newValue;
                });
              },
              value: dropDownButton,
              items: const [
                DropdownMenuItem<String>(value: "one", child: Text('hello'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

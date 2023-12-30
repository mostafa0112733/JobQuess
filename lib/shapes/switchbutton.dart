import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final String name;
  const SwitchButton({super.key, required this.name});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 60,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black, // Border color
      width: 0.3, // Border width
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          widget.name ,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ),
    ],
  ),
);

  
  }
}

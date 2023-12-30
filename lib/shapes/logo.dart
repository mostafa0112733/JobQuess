import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
 
    return Row(
   
      children: [
        Text(
          "J",
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w700,
          ),
        ),
        Icon(
          Icons.search,
          size: size,
        ),
        Text(
          'BSQUE',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}

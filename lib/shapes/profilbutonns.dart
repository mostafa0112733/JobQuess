import 'package:flutter/material.dart';

class ProfilButtons extends StatelessWidget {
  final String token;
  final String image;
  final String name;

  final Widget Function(String token) pageBuilder;

  const ProfilButtons({
    Key? key,
    required this.token,
    required this.name,
    required this.image,
    required this.pageBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageBuilder(token),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_right),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileBittons2 extends StatelessWidget {
  final String name;
  final String token;
  final Widget Function(String token) pageBuilder;
ProfileBittons2({Key?key,
required this.name,
required this.token,
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
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
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

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(

        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),          labelText: 'Search',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.3),
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Searchh extends StatefulWidget {
  final Function(String) onSearch;
   final String token;
   final String userName;
  const Searchh({super.key ,required this.token, required this.userName,required this.onSearch});


  @override
  _SearchhState createState() => _SearchhState();
}

class _SearchhState extends State<Searchh> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: _searchController,
        onChanged: (query) {
          widget.onSearch(query);
        },
        decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(Icons.search),
          labelText: 'Search',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.3),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

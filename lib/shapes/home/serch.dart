import 'package:flutter/material.dart';

class Searchh extends StatefulWidget {
  final Function(String) onSearch;

  const Searchh({Key? key, required this.onSearch}) : super(key: key);

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

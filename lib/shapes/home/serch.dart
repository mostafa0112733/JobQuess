import 'package:flutter/material.dart';

class Searchh extends StatefulWidget {
  final Function(String) onSearch;
  final String token;
  final String userName;

  const Searchh({
    Key? key,
    required this.token,
    required this.userName,
    required this.onSearch,
  }) : super(key: key);

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
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          Expanded(
            child: TextFormField(
              controller: _searchController,
           
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Type Something',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

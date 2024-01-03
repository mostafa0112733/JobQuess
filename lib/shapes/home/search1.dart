import 'package:flutter/material.dart';
import 'package:project/Home_screen/searchpage.dart';

class Searchone extends StatelessWidget {
   final String token;
   final String userName;
  const Searchone({super.key ,required this.token, required this.userName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the search page here
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(token: token,userName: userName,),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            Text(
              'Search',
              style: TextStyle(fontWeight: FontWeight.w700), 
            ),
          ],
        ),
      ),
    );
  }
}


    
    
    
//     Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextFormField(

//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search),          labelText: 'Search',
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black, width: 0.3),
//             borderRadius: BorderRadius.circular(30)
//           ),
//         ),
//       ),
//     );
//   }
// }

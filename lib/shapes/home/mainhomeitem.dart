import 'package:flutter/material.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/models/savedModel.dart';
import 'package:project/shapes/home/rowsbutton.dart';
import 'package:provider/provider.dart';

class MHI extends StatelessWidget {
  final Job jobs;
  final Widget path;

  const MHI({
    Key? key,
    required this.jobs,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => path));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, 
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                jobs.image,
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    jobs.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    jobs.jobType,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Spacer(),
              
              ElevatedButton(onPressed: () {
                // Use provider to access the CartModel and add the product to the cart
                Provider.of<SavedModel>(context, listen: false)
                    .addToCart(jobs);
              }, child:   Image.asset(
                 'assets/images/Icons/archive-minus.png',
                color: Colors.black,
               ))
             
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RB(
                  btncolor: Color.fromARGB(255, 119, 186, 230),
                  name: jobs.jobTimeType),
              Spacer(),
              Text('${jobs.salary}K',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              Text("/Month",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

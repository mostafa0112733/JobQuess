import 'package:flutter/material.dart';
import 'package:project/models/jobesmodel.dart';
import 'package:project/models/savedModel.dart';
import 'package:project/shapes/home/rowsbutton.dart';
import 'package:provider/provider.dart';

class MHI extends StatefulWidget {
  final Job jobs;
  final Widget path;

  const MHI({
    Key? key,
    required this.jobs,
    required this.path,
  }) : super(key: key);

  @override
  _MHIState createState() => _MHIState();
}

class _MHIState extends State<MHI> {
  bool isBlue = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.path));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                widget.jobs.image,
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
                    widget.jobs.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.jobs.jobType,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isBlue = !isBlue;
                  });

                  final savedModel =
                      Provider.of<SavedModel>(context, listen: false);

                  if (savedModel.savedItems.contains(widget.jobs)) {
                    savedModel.remove(widget.jobs);
                  } else {
                    savedModel.add(widget.jobs);
                  }
                },
                icon: Icon(
                  Icons.archive_outlined,
                  color: isBlue ? Colors.blue : Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RB(
                  btncolor: Color.fromARGB(255, 119, 186, 230),
                  name: widget.jobs.jobTimeType),
              Spacer(),
              Text(
                '${widget.jobs.salary}K',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                "/Month",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
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

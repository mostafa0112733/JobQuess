import 'package:flutter/material.dart';
import 'package:project/complete_profi/education.dart';
// import 'package:project/complete%20profile/educartion.dart';
import 'package:project/shapes/elevatedButtonwithTitle.dart';
import 'package:project/shapes/pagetitle.dart';

class CompleteFileTwo extends StatefulWidget {
  final String token;
final int user_id;
  const CompleteFileTwo({super.key, required this.token,required this.user_id});

  @override
  State<CompleteFileTwo> createState() => _CompleteFileTwoState();
}
class _CompleteFileTwoState extends State<CompleteFileTwo> {
  late final TextEditingController BioController;
  late final TextEditingController AddressController;
  late final TextEditingController MobileController;
  @override
  void initState() {
    super.initState();
    BioController = TextEditingController();
    AddressController = TextEditingController();
    MobileController = TextEditingController();
  }

  @override
  void dispose() {
    BioController.dispose();
    AddressController.dispose();
    MobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  PageTitle(
                    name: 'Personal Details',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                              AssetImage('assets/images/person.png'),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Change Photo",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )))
                          ],
                        ),
                        TextFormFieldWithTitle(
                          name: 'Bio',
                          Controller: BioController, icon: null,
                        ),
                        TextFormFieldWithTitle(
                          name: 'Address',
                          Controller: AddressController, icon: null,
                        ),
                        TextFormFieldWithTitle(
                          name: 'Mobile',
                          Controller: MobileController, icon: null,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Education(token: widget.token, user_id: widget.user_id,)));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 26),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}

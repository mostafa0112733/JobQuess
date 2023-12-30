import 'package:flutter/material.dart';
import 'package:project/shapes/pagetitle.dart';

class AppledJob extends StatefulWidget {
  const AppledJob({super.key});

  @override
  State<AppledJob> createState() => _AppledJobState();
}

class _AppledJobState extends State<AppledJob>
    with SingleTickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            PageTitle(name: 'Appled Job'),
            TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(30),
                tabs: [
                  Tab(
                      child: Text("Active",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ))),
                  Tab(
                      child: Text("Rejected",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )))
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: ClipRRect(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      children: [Text('data')],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 139, 187, 226),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Image.asset(
                              'assets/images/successful/clipboard-close.png',
                              width: 50,
                              height: 50,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("No applications were rejected",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "If there is an application that is rejected by the \n company it will appear here",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

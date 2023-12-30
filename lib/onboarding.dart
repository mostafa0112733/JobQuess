import 'package:flutter/material.dart';
import 'package:project/LOGIN/login.dart';
import 'package:project/onboadrdin/Second.dart';
import 'package:project/onboadrdin/first.dart';
import 'package:project/onboadrdin/third.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(30),
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (index) => setState(() {
                    lastPage = (index == 2);
                  }),
                  controller: _pageController,
                  children: [
                    First(),
                    second(),
                    Third(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmoothPageIndicator(controller: _pageController, count: 3),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 14,
                      child: lastPage
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: Text(
                                'Get Started',
                                style: TextStyle(fontSize: 26),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 26),
                              ),
                            ),
                    )
                  ],
                ),
              ],
            )));
  }
}

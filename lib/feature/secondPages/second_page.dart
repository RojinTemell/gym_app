import 'package:flutter/material.dart';
import 'package:gym_app/feature/secondPages/second_page1.dart';
import 'package:gym_app/feature/secondPages/second_page2.dart';
import 'package:gym_app/feature/secondPages/second_page3.dart';
import 'package:gym_app/product/constants/color_constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  int _activePage = 0;

  final List<Widget> _pages = [
    const SecondPage1(),
    const SecondPage2(),
    const SecondPage3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              }),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            width: _activePage == index ? 40 : 20,
                            height: 5,
                            color: _activePage == index
                                ? ColorsConstants.blueColor
                                : ColorsConstants.tunaColor,
                          ),
                        ),
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}

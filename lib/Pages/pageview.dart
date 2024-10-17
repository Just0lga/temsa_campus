import 'package:flutter/material.dart';

class pageviewer extends StatefulWidget {
  final Widget page1;
  final Widget page2;
  final Widget page3;
  pageviewer(
      {super.key,
      required this.page1,
      required this.page2,
      required this.page3});

  @override
  State<pageviewer> createState() => _pageviewerState();
}

class _pageviewerState extends State<pageviewer> {
  final pageController = PageController(
    initialPage: 1,
    keepPage: true,
    onDetach: (position) => 0.25,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          widget.page1,
          widget.page2,
          widget.page3,
        ],
      ),
    );
  }
}

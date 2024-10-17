import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/Pages/login.dart';
import 'package:temsa_campus/colors/colors.dart';

class Openpage extends StatefulWidget {
  const Openpage({super.key});

  @override
  State<Openpage> createState() => _OpenpageState();
}

class _OpenpageState extends State<Openpage> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login_Page(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors().grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/temsalogo.png", height: height * 0.15),
              LoadingAnimationWidget.hexagonDots(
                  color: AppColors().blue, size: height * 0.05)
            ],
          ),
        ));
  }
}

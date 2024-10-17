import 'package:flutter/material.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class TopInfoBox extends StatelessWidget {
  const TopInfoBox(
      {super.key,
      this.iconColor,
      required this.width,
      required this.height,
      required this.text1,
      required this.text2,
      required this.color});

  final bool? iconColor;
  final double width;
  final double height;
  final String text1;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Container(
        width: width,
        constraints: BoxConstraints(
          minHeight: height * 0.08,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
            color: color,
            borderRadius:
                BorderRadiusDirectional.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.1,
                  child: Icon(
                    text1 == "SAT ONAY FORMU"
                        ? Icons.travel_explore
                        : Icons.attach_money,
                    size: height * 0.05,
                    color: iconColor == true
                        ? Colors.green
                        : iconColor == false
                            ? Colors.red
                            : AppColors().blue,
                  )),
              SizedBox(width: width * 0.1),
              Container(
                  alignment: Alignment.center,
                  width: width * 0.4,
                  child: Text(text1, style: Textstyles.text3)),
              Container(
                  width: width * 0.22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(text2, style: Textstyles.text6),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class MiddleInfoBox extends StatelessWidget {
  const MiddleInfoBox(
      {super.key,
      required this.width,
      required this.height,
      required this.text1,
      required this.text2,
      required this.color});

  final double width;
  final double height;
  final String text1;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Container(
        width: width,
        constraints: BoxConstraints(
          minHeight: height * 0.08,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ], color: color),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.30,
                  child: Text(text1, style: Textstyles.text3)),
              Container(
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(text2, style: Textstyles.text3),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BottomInfoBox extends StatelessWidget {
  const BottomInfoBox(
      {super.key,
      required this.width,
      required this.height,
      required this.text1,
      required this.text2,
      required this.color});

  final double width;
  final double height;
  final String text1;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Container(
        width: width,
        constraints: BoxConstraints(
          minHeight: height * 0.08,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
            color: color,
            borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.30,
                  child: Text(text1, style: Textstyles.text3)),
              Container(
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(text2, style: Textstyles.text3),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

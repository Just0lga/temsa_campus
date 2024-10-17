import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.action});
  final Widget action;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      actions: [action],
      elevation: 5,
      shadowColor: Colors.black,
      centerTitle: true,
      title: Image.asset(
        "images/temsalogo.png",
        height: width * 0.12,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

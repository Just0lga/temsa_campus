import 'package:flutter/material.dart';
import 'package:temsa_campus/colors/colors.dart';

class Mylisttile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;
  const Mylisttile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        iconColor: AppColors().blue,
        onTap: onTap,
        leading: Icon(
          icon,
          color: AppColors().blue,
        ),
        title: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

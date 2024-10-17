// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:temsa_campus/Pages/OpenPage.dart';
import 'package:temsa_campus/oldPages/approve.dart';
import 'package:temsa_campus/Pages/confirmations.dart';
import 'package:temsa_campus/Pages/homepage.dart';
import 'package:temsa_campus/Pages/login.dart';
import 'package:temsa_campus/Pages/myProfile.dart';
import 'package:temsa_campus/oldPages/mails_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      home: //Mails_Info(), //Count_Info(),
          //Login_Page(),
          //Mails_Info(),
          //Homepage(),
          //Approve(),
          Openpage(),
      routes: {
        "/homepage": (context) => MyProfile(),
        "/approve": (context) => Approve()
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:temsa_campus/Pages/confirmations.dart';
import 'package:temsa_campus/Pages/homepage.dart';
import 'package:temsa_campus/Pages/myProfile.dart';
import 'package:temsa_campus/widgets/myListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(child: Image.asset("images/temsalogo.png")),
          Mylisttile(
            icon: Icons.home,
            text: "Home",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ));
            },
          ),
          Mylisttile(
            icon: Icons.person,
            text: "My Profile",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ));
            },
          ),
          Mylisttile(
            icon: Icons.mail,
            text: "Mails",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Confirmations(),
                  ));
            },
          )
        ],
      ),
    );
  }
}

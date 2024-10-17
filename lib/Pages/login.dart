import 'package:flutter/material.dart';
import 'package:temsa_campus/Pages/homepage.dart';
import 'package:temsa_campus/colors/colors.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => Login_PageState();
}

class Login_PageState extends State<Login_Page> {
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          "images/temsalogo.png",
          height: width * 0.10,
        ),
        iconTheme: IconThemeData(color: AppColors().blue),
        leading: SizedBox(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LoginTextField(
              loginTextController: usernameTextController,
              icon: Icons.person_2_outlined,
              hintText: 'E-mail',
              labelText: "E-mail",
            ),
            _LoginTextField(
              loginTextController: passwordTextController,
              icon: Icons.vpn_key_outlined,
              hintText: 'Password',
              labelText: "Password",
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: AppColors().blue,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField(
      {super.key,
      required this.loginTextController,
      required this.icon,
      required this.hintText,
      required this.labelText,
      this.obscureText,
      this.enableSuggestions,
      this.autocorrect});

  final TextEditingController loginTextController;
  final IconData icon;
  final String hintText;
  final String labelText;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.05),
      child: SizedBox(
        height: height * 0.08,
        child: TextField(
          obscureText: obscureText ?? false,
          enableSuggestions: enableSuggestions ?? true,
          autocorrect: autocorrect ?? true,
          textAlignVertical: TextAlignVertical.center,
          controller: loginTextController,
          cursorColor: AppColors().blue,
          cursorHeight: height * 0.03,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusColor: AppColors().red,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors().grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Icon(
              icon,
              color: AppColors().blue,
            ),
            filled: true,
            fillColor: AppColors().grey,
            labelText: hintText,
            hintText: hintText,
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

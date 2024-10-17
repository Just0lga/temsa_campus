import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/Pages/confirmations.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/widgets/infoBox.dart';

class SAT_Onay extends StatefulWidget {
  final String Talep_Sahibi;
  final String Talep_No;
  final String Belge_Turu;
  final String Sat_Tarihi;
  final String Toplam_Fiyat;
  final String Aciklama;
  final String Duran_Varlik_No;
  const SAT_Onay(
      {super.key,
      this.List,
      required this.Talep_Sahibi,
      required this.Talep_No,
      required this.Belge_Turu,
      required this.Sat_Tarihi,
      required this.Toplam_Fiyat,
      required this.Aciklama,
      required this.Duran_Varlik_No});
  final List;

  @override
  State<SAT_Onay> createState() => _SAT_OnayState();
}

class _SAT_OnayState extends State<SAT_Onay> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Confirmations(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors().onay,
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.031),
                  child: LoadingAnimationWidget.hexagonDots(
                      color: Colors.green, size: 50),
                ),
                TopInfoBox(
                    iconColor: true,
                    color: AppColors().onay,
                    width: width,
                    height: height * 1.5,
                    text1: widget.Belge_Turu,
                    text2: widget.Sat_Tarihi),
                MiddleInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height * 0.9,
                    text1: "Talep Sahibi:",
                    text2: widget.Talep_Sahibi),
                MiddleInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height * 0.9,
                    text1: "Talep No:",
                    text2: widget.Talep_No),
                MiddleInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height * 0.9,
                    text1: "Belge Türü:",
                    text2: widget.Belge_Turu),
                MiddleInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height * 0.9,
                    text1: "Toplam Fiyat:",
                    text2: widget.Toplam_Fiyat),
                MiddleInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height,
                    text1: "Açıklama:",
                    text2: widget.Aciklama),
                BottomInfoBox(
                    color: AppColors().onay,
                    width: width,
                    height: height * 1.5,
                    text1: "Duran Varlık No:",
                    text2: widget.Duran_Varlik_No),
                SizedBox(
                  height: height * 0.075,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

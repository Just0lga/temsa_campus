import 'package:flutter/material.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/forms/SAT/SAT_onay.dart';
import 'package:temsa_campus/forms/SAT/SAT_red.dart';
import 'package:temsa_campus/widgets/infoBox.dart';
import 'package:temsa_campus/widgets/myDrawer.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class SAT extends StatefulWidget {
  final String Talep_Sahibi;
  final String Talep_No;
  final String Belge_Turu;
  final String Sat_Tarihi;
  final String Toplam_Fiyat;
  final String Aciklama;
  final String Duran_Varlik_No;

  const SAT(
      {super.key,
      required this.Talep_Sahibi,
      required this.Talep_No,
      required this.Belge_Turu,
      required this.Sat_Tarihi,
      required this.Toplam_Fiyat,
      required this.Aciklama,
      required this.Duran_Varlik_No});

  @override
  State<SAT> createState() => _SATState();
}

class _SATState extends State<SAT> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Onayımda bekleyenler",
          style: Textstyles.text2,
        ),
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: AppColors().blue,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: height * 0.05),
                TopInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 1.5,
                    text1: widget.Belge_Turu,
                    text2: widget.Sat_Tarihi),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 0.9,
                    text1: "Talep Sahibi:",
                    text2: widget.Talep_Sahibi),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 0.9,
                    text1: "Talep No:",
                    text2: widget.Talep_No),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 0.9,
                    text1: "Belge Türü:",
                    text2: widget.Belge_Turu),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 0.9,
                    text1: "Toplam Fiyat:",
                    text2: widget.Toplam_Fiyat),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Açıklama:",
                    text2: widget.Aciklama),
                BottomInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height * 1.5,
                    text1: "Duran Varlık No:",
                    text2: widget.Duran_Varlik_No),
                SizedBox(
                  height: height * 0.05,
                ),
                confirmationButtons(
                    height: height,
                    width: width,
                    Talep_Sahibi: widget.Talep_Sahibi,
                    Talep_No: widget.Talep_No,
                    Belge_Turu: widget.Belge_Turu,
                    Sat_Tarihi: widget.Sat_Tarihi,
                    Toplam_Fiyat: widget.Toplam_Fiyat,
                    Aciklama: widget.Aciklama,
                    Duran_Varlik_No: widget.Duran_Varlik_No)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class confirmationButtons extends StatelessWidget {
  const confirmationButtons({
    super.key,
    required this.height,
    required this.width,
    required this.Talep_Sahibi,
    required this.Talep_No,
    required this.Belge_Turu,
    required this.Sat_Tarihi,
    required this.Toplam_Fiyat,
    required this.Aciklama,
    required this.Duran_Varlik_No,
  });
  final double height;
  final double width;
  final String Talep_Sahibi;
  final String Talep_No;
  final String Belge_Turu;
  final String Sat_Tarihi;
  final String Toplam_Fiyat;
  final String Aciklama;
  final String Duran_Varlik_No;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height * 0.15,
      color: AppColors().grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * 0.4,
            height: height * 0.1,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAT_Onay(
                          Talep_Sahibi: Duran_Varlik_No,
                          Talep_No: Talep_No,
                          Belge_Turu: Belge_Turu,
                          Sat_Tarihi: Sat_Tarihi,
                          Toplam_Fiyat: Toplam_Fiyat,
                          Aciklama: Aciklama,
                          Duran_Varlik_No: Duran_Varlik_No),
                    ));
              },
              child: Text(
                "Onayla",
                style: Textstyles.onay,
              ),
              style: OutlinedButton.styleFrom(
                  overlayColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                      width: 3.0, color: Color.fromARGB(255, 30, 199, 36))),
            ),
          ),
          Container(
            width: width * 0.4,
            height: height * 0.1,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAT_red(
                          Talep_Sahibi: Duran_Varlik_No,
                          Talep_No: Talep_No,
                          Belge_Turu: Belge_Turu,
                          Sat_Tarihi: Sat_Tarihi,
                          Toplam_Fiyat: Toplam_Fiyat,
                          Aciklama: Aciklama,
                          Duran_Varlik_No: Duran_Varlik_No),
                    ));
              },
              child: Text(
                "Red",
                style: Textstyles.red,
              ),
              style: OutlinedButton.styleFrom(
                  overlayColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 3.0, color: Colors.red)),
            ),
          )
        ],
      ),
    );
  }
}

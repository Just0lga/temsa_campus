import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class RequestType extends StatelessWidget {
  const RequestType({
    super.key,
    required this.runFilter,
  });
  final Function runFilter;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => showPopover(
            context: context,
            bodyBuilder: (context) => PopUpMenu(
                  runFilter: runFilter,
                ),
            width: width * 0.35,
            height: height * 0.35),
        child: Container(
          alignment: Alignment.center,
          width: width * 0.3,
          height: height * 0.04,
          decoration: BoxDecoration(
            color: AppColors().grey2,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: Colors.black,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.025),
                child: Text("Talep türü"),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ));
  }
}

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    super.key,
    required this.runFilter,
  });
  final Function runFilter;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            runFilter("");
            Navigator.pop(context);
          },
          child: Container(
              color: AppColors().grey2,
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              child: Text(
                "Hepsi",
                textAlign: TextAlign.center,
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("SAT Onay Formu");
            Navigator.pop(context);
          },
          child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              child: Text(
                "SAT Onay Formu",
                textAlign: TextAlign.center,
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("Münferit Formu");
            Navigator.pop(context);
          },
          child: Container(
              color: AppColors().grey2,
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              child: Text(
                "Münferit Formu",
                textAlign: TextAlign.center,
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("Seyahat Onay Formu");
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              color: Colors.white,
              child: Text(
                "Seyahat Onay Formu",
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("Fatura Formu");
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              color: AppColors().grey2,
              child: Text(
                "Fatura Formu",
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("SAS Onay Formu");
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              color: Colors.white,
              child: Text(
                "SAS Onay Formu",
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            runFilter("Masraf Formu");
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.35,
              height: height * 0.05,
              color: AppColors().grey2,
              child: Text(
                "Masraf Formu",
                style: Textstyles.text7,
              )),
        ),
      ],
    );
  }
}

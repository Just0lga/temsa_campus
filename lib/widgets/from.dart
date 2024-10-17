import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class From extends StatelessWidget {
  const From({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => showPopover(
            context: context,
            bodyBuilder: (context) => PopTarih(),
            width: width * 0.5,
            height: height * 0.20),
        child: Container(
          alignment: Alignment.center,
          width: width * 0.25,
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
                padding:
                    EdgeInsets.only(right: width * 0.02, left: width * 0.04),
                child: Text("Kimden"),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ));
  }
}

class PopTarih extends StatelessWidget {
  const PopTarih({
    super.key,
  });

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
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.5,
              height: height * 0.05,
              color: Colors.white,
              child: Text(
                "mustafa.akpinar@temsa.com",
                textAlign: TextAlign.center,
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.5,
              height: height * 0.05,
              color: AppColors().grey2,
              child: Text(
                "erdinc.ugurlu@temsa.com",
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.5,
              height: height * 0.05,
              color: Colors.white,
              child: Text(
                "tolga.kucukasci@temsa.com",
                style: Textstyles.text7,
              )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              alignment: Alignment.center,
              width: width * 0.5,
              height: height * 0.05,
              color: AppColors().grey2,
              child: Text(
                "berfin.tugal@temsa.com",
                style: Textstyles.text7,
              )),
        )
      ],
    );
  }
}

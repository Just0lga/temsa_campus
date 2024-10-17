import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/Pages/confirmations.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/models/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/services/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/widgets/myAppBar.dart';
import 'package:temsa_campus/widgets/myDrawer.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<TechOnay_GetAllProcessCount>? _items;
  bool _isLoading = false;
  final Fetch_TechOnay_GetAllProcessCount _fetchService =
      Fetch_TechOnay_GetAllProcessCount();

  @override
  void initState() {
    fetchPost_TechOnay_GetAllProcessCount();
    super.initState();
  }

  void fetchPost_TechOnay_GetAllProcessCount() async {
    changeLoading();
    final items = await _fetchService.fetchPost_TechOnay_GetAllProcessCount(
        "https://360api.temsa.com/api/TechOnay/GetAllProcessCount?email=erdinc.ugurlu@temsa.com");
    setState(() {
      _items = items;
    });
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(_items?[0].data?.count?.toString());
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    changeLoading();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(
        action: IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        child: ListView(
          children: [
            Column(
              children: [
                TitleText(),
                News(),
                Row(
                  children: [
                    Pending_approvals(
                      text: "Yeni İşe Başlayanlar",
                      icon: Icons.work,
                      newMailNumber: _items != null && _items!.isNotEmpty
                          ? Text("+16",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                          : LoadingAnimationWidget.hexagonDots(
                              color: Colors.white, size: 25),
                      color: AppColors().darkBlue,
                    ),
                    SizedBox(width: width * 0.02),
                    Pending_approvals(
                      text: "Onayımda Bekleyenler",
                      icon: Icons.mail_outline_outlined,
                      newMailNumber: _items != null && _items!.isNotEmpty
                          ? Text(_items![0].data?.count?.toString() ?? '0',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                          : LoadingAnimationWidget.hexagonDots(
                              color: Colors.white, size: 25),
                      color: AppColors().blue,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                GestureDetector(
                  child: Container(
                      width: width * 0.9,
                      height: height * 0.16,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors().blue,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              "Bu ay",
                              style: Textstyles.text2,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text("70",
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "kişinin",
                                style: Textstyles.text5,
                              ),
                              Text(
                                "doğum günü",
                                style: Textstyles.text5,
                              )
                            ],
                          ),
                          SizedBox(width: width * 0.04),
                          Icon(
                            Icons.wallet_giftcard_outlined,
                            color: AppColors().iconBlue,
                            size: 96,
                          )
                        ],
                      )),
                ),
                SizedBox(height: height * 0.04),
                GestureDetector(
                  child: Container(
                      width: width * 0.9,
                      height: height * 0.16,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFA4A5AE),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bugün", style: Textstyles.text2),
                              Text(
                                "Yemekte Ne Var?",
                                style: Textstyles.text2,
                              ),
                            ],
                          ),
                          SizedBox(width: width * 0.14),
                          Icon(
                            Icons.food_bank,
                            color: Color(0xFFEDEDEF),
                            size: 96,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.3, bottom: height * 0.02),
      child: Text(
        "Haberler ve Duyurular",
        style: Textstyles.text4,
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: width * 0.9,
          height: height * 0.35,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
              borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.asset("images/bus.jpg", fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          left: width * 0.05,
          right: 0,
          top: height * 0.2,
          child: Text(
            "Yeni Çağrı Merkezi ve Hızlı Yol Yardım Hizmetleri ile TEMSA Müşterilerinin Yanında",
            style: Textstyles.text2,
          ),
        ),
      ],
    );
  }
}

class Pending_approvals extends StatelessWidget {
  const Pending_approvals(
      {super.key,
      required this.text,
      required this.icon,
      required this.newMailNumber,
      required this.color});
  final String text;
  final IconData icon;
  final Widget newMailNumber;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Confirmations(),
            ));
      },
      child: Container(
        height: height * 0.2,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.04),
              child: Container(
                height: height * 0.16,
                width: width * 0.425,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.2, top: height * 0.01),
                      child: Icon(
                        icon,
                        color: AppColors().iconBlue,
                        size: 64,
                      ),
                    ),
                    Text(
                      text,
                      style: Textstyles.text5,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01, left: width * 0.32),
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: width * 0.06,
                  child: newMailNumber),
            )
          ],
        ),
      ),
    );
  }
}

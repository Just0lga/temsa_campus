import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/Pages/confirmations.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/models/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/services/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/widgets/myDrawer.dart';

class Approve extends StatefulWidget {
  const Approve({super.key});

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  List<TechOnay_GetAllProcessCount>? _items;
  bool _isLoading = false;
  final Fetch_TechOnay_GetAllProcessCount _fetchService =
      Fetch_TechOnay_GetAllProcessCount();

  @override
  void initState() {
    fetchPost_TechOnay_GetAllProcessCount();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black,
          centerTitle: true,
          title: Image.asset(
            "images/temsalogo.png",
            height: width * 0.12,
          ),
          iconTheme: IconThemeData(color: AppColors().blue),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.25,
                        width: width * 0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().blue,
                            boxShadow: [
                              BoxShadow(blurRadius: 20, color: Colors.black)
                            ]),
                      ),
                      Row(children: [
                        ApproveBox(
                          text: "  Yeni işe başlayanlar",
                          icon: Icons.work,
                          newMailNumber: _items != null && _items!.isNotEmpty
                              ? Text(_items![0].data?.count?.toString() ?? '0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                              : LoadingAnimationWidget.hexagonDots(
                                  color: Colors.white, size: 25),
                        ),
                        ApproveBox(
                          text: "Onayimda bekleyenler",
                          icon: Icons.mark_email_read_outlined,
                          newMailNumber: _items != null && _items!.isNotEmpty
                              ? Text(_items![0].data?.count?.toString() ?? '0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                              : LoadingAnimationWidget.hexagonDots(
                                  color: Colors.white, size: 25),
                        ),
                      ]),
                      Container(
                        height: height * 0.15,
                        width: width * 0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().blue,
                            boxShadow: [
                              BoxShadow(blurRadius: 20, color: Colors.black)
                            ]),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.15,
                        width: width * 0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors().blue,
                            boxShadow: [
                              BoxShadow(blurRadius: 20, color: Colors.black)
                            ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ApproveBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget newMailNumber;

  const ApproveBox({
    super.key,
    required this.text,
    required this.icon,
    required this.newMailNumber,
  });

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
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.28,
                width: width * 0.48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: width * 0.073,
                top: width * 0.1,
                child: Container(
                  height: height * 0.15,
                  width: width * 0.36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 12, 100, 172),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
                  ),
                ),
              ),
              Positioned(
                  left: width * 0.11,
                  top: height * 0.07,
                  child: Icon(
                    icon,
                    color: const Color(0xFFC9D9EB),
                    size: 64,
                  )),
              Positioned(
                  top: height * 0.16,
                  left: width * 0.078,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
              Positioned(
                bottom: height * 0.175,
                left: width * 0.33,
                child: Container(
                  child: Center(
                    child: newMailNumber,
                  ),
                  height: height * 0.07,
                  width: width * 0.12,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

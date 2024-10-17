import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/Pages/pageview.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/forms/SAT/SAT.dart';
import 'package:temsa_campus/forms/SAT/SAT_onay.dart';
import 'package:temsa_campus/forms/SAT/SAT_red.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalFormDetail.dart';
import 'package:temsa_campus/services/TechOnay/GetApprovalFormDetail.dart';
import 'package:temsa_campus/widgets/from.dart';
import 'package:temsa_campus/widgets/is_read.dart';
import 'package:temsa_campus/widgets/myDrawer.dart';
import 'package:temsa_campus/widgets/request_type.dart';
import 'package:temsa_campus/widgets/searchTextField.dart';
import 'package:temsa_campus/widgets/date.dart';
import 'package:temsa_campus/widgets/textstyles.dart';

class Confirmations extends StatefulWidget {
  const Confirmations({super.key});

  @override
  State<Confirmations> createState() => ConfirmationsState();
}

class ConfirmationsState extends State<Confirmations> {
  final TextEditingController textController = TextEditingController();
  List<TechOnay_GetApprovalFormDetail>? _items;
  bool _isLoading = false;
  final Fetch_TechOnay_GetApprovalFormDetail _fetchService =
      Fetch_TechOnay_GetApprovalFormDetail();

  List<TechOnay_GetApprovalFormDetail>? foundUsers;

  @override
  void initState() {
    super.initState();
    fetch_TechOnay_GetApprovalFormDetail();
  }

  void runFilter(String enteredKeyword) {
    List<TechOnay_GetApprovalFormDetail>? results = [];
    List<TechOnay_GetApprovalFormDetail>? emptyResults = [];

    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
      for (var user in _items ?? emptyResults) {
        if (user.processId!
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase())) {
          results.add(user);
        }
      }
      for (var user in _items ?? emptyResults) {
        if (user.turu!.toLowerCase().contains(enteredKeyword.toLowerCase())) {
          results.add(user);
        }
      }
    }
    setState(() {
      foundUsers = results;
    });
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetch_TechOnay_GetApprovalFormDetail() async {
    changeLoading();
    final items = await _fetchService.fetchPost_TechOnay_GetApprovalForms();
    setState(() {
      _items = items;
      foundUsers = items;
    });
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors().blue,
        centerTitle: true,
        title: Text(
          "Onayımda bekleyenler",
          style: Textstyles.text2,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.5,
                    color: Colors.black,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              height: height * 0.07,
              width: width * 0.9,
              child: ConfirmationTextField(
                textController: textController,
                runFilter: runFilter,
              ),
            ),
          ),
          Container(
            height: height * 0.05,
            width: width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05,
                      bottom: height * 0.008,
                      top: height * 0.008,
                      right: width * 0.01),
                  child: RequestType(
                    runFilter: runFilter,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.008, horizontal: width * 0.01),
                  child: Date(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.008, horizontal: width * 0.01),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.001, horizontal: width * 0.01),
                    child: From(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.008, horizontal: width * 0.01),
                  child: IsRead(),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.015),
          Expanded(
            child: _isLoading
                ? Padding(
                    padding: EdgeInsets.only(bottom: height * 0.2),
                    child: LoadingAnimationWidget.hexagonDots(
                        color: AppColors().blue, size: 50),
                  )
                : foundUsers == null || foundUsers!.isEmpty
                    ? Text("Bulunamadı")
                    : ListView.builder(
                        itemCount: foundUsers!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => pageviewer(
                                      page1: SAT_Onay(
                                          Talep_Sahibi:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Talep_No:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Belge_Turu:
                                              foundUsers![index].turu ?? "?",
                                          Sat_Tarihi:
                                              foundUsers![index].gun ?? "?",
                                          Toplam_Fiyat:
                                              foundUsers![index].currency ??
                                                  "?",
                                          Aciklama:
                                              "Şirketimize satın alınması planlanan ürünler icin SAT onay formumuzun onaylanmasını teklif ediyoruz",
                                          Duran_Varlik_No:
                                              foundUsers![index].processId ??
                                                  "?"),
                                      page2: SAT(
                                          Talep_Sahibi:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Talep_No:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Belge_Turu:
                                              foundUsers![index].turu ?? "?",
                                          Sat_Tarihi:
                                              foundUsers![index].gun ?? "?",
                                          Toplam_Fiyat:
                                              foundUsers![index].currency ??
                                                  "?",
                                          Aciklama:
                                              "Şirketimize satın alınması planlanan ürünler icin SAT onay formumuzun onaylanmasını teklif ediyoruz",
                                          Duran_Varlik_No:
                                              foundUsers![index].processId ??
                                                  "?"),
                                      page3: SAT_red(
                                          Talep_Sahibi:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Talep_No:
                                              foundUsers![index].processId ??
                                                  "?",
                                          Belge_Turu:
                                              foundUsers![index].turu ?? "?",
                                          Sat_Tarihi:
                                              foundUsers![index].gun ?? "?",
                                          Toplam_Fiyat:
                                              foundUsers![index].currency ??
                                                  "?",
                                          Aciklama:
                                              "Şirketimize satın alınması planlanan ürünler icin SAT onay formumuzun onaylanmasını teklif ediyoruz",
                                          Duran_Varlik_No:
                                              foundUsers![index].processId ??
                                                  "?"),
                                    ),
                                  ));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.005),
                              child: Container(
                                height: MediaQuery.of(context)
                                            .orientation
                                            .toString() ==
                                        "Orientation.landscape"
                                    ? height * 0.2
                                    : height * 0.13,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors().grey,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.5,
                                          color: Colors.black,
                                          offset: Offset(0, 1))
                                    ]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.2,
                                      child: Column(
                                        children: [
                                          SizedBox(height: height * 0.025),
                                          Icon(
                                            foundUsers![index].turu ==
                                                    "SAT Onay Formu"
                                                ? Icons.attach_money
                                                : foundUsers![index].turu ==
                                                        "Seyahat Formu"
                                                    ? Icons.travel_explore
                                                    : Icons
                                                        .insert_drive_file_outlined,
                                            size: height * 0.07,
                                            color: AppColors().blue,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                foundUsers![index].processId ??
                                                    "?",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.02),
                                                child: Text(
                                                  foundUsers![index].turu ??
                                                      "?",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                foundUsers![index].gun ?? "?",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.02),
                                                child: Text(
                                                  "72.000" + " \$",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors().blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.02),
                                                child: SizedBox(
                                                  height: height * 0.06,
                                                  width: width * 0.78,
                                                  child: Text(
                                                    "Şirketimize satın alınması planlanan ürünler icin SAT onay formumuzun onaylanmasını teklif ediyoruz",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

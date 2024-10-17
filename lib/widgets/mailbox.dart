import 'package:flutter/material.dart';
import 'package:temsa_campus/colors/colors.dart';

// ignore: must_be_immutable
class MailBox extends StatefulWidget {
  List<Map<String, dynamic>> allUsers;
  List<Map<String, dynamic>> foundUsers;
  MailBox({super.key, required this.allUsers, required this.foundUsers});

  @override
  State<MailBox> createState() => _MailBoxState();
}

class _MailBoxState extends State<MailBox> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.foundUsers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/pageview");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.01),
              child: Container(
                height: height * 0.13,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors().grey,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(1, 4))
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.025),
                          Icon(
                            Icons.travel_explore,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.foundUsers[index]["name"],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.02),
                                child: Text(
                                  widget.foundUsers[index]["status"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.foundUsers[index]["date"],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.02),
                                child: Text(
                                  widget.foundUsers[index]["amount"] == 0
                                      ? ""
                                      : widget.foundUsers[index]["amount"]
                                              .toString() +
                                          " \$",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors().blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.02),
                                child: SizedBox(
                                  height: height * 0.06,
                                  width: width * 0.78,
                                  child: Text(
                                    widget.foundUsers[index]["description"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
    );
  }
}

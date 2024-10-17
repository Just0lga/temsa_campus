import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temsa_campus/colors/colors.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';
import 'package:temsa_campus/services/Auth/get_Auth_Login.dart';
import 'package:temsa_campus/widgets/infoBox.dart';
import 'package:temsa_campus/widgets/myDrawer.dart';

class MyProfile extends StatefulWidget {
  MyProfile({super.key});
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<AuthModel>? _items;
  bool _isLoading = false;
  final FetchService _fetchService = FetchService();

  @override
  void initState() {
    fetchPostItems();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetchPostItems() async {
    changeLoading();
    final items = await _fetchService.fetchPostItems(
        "https://360api.temsa.com/api/Auth/Login?userName=erdinc.ugurlu@temsa.com");

    setState(() {
      _items = items;
    });
    changeLoading();
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(_items?[0].token?.accessToken);
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors().blue),
        centerTitle: true,
        title: Image.asset(
          "images/temsalogo.png",
          height: 40,
        ),
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          _isLoading
              ? LoadingAnimationWidget.hexagonDots(
                  color: AppColors().blue, size: 50)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      )))
        ],
      ),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                TopInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Name:",
                    text2: _items?[index].user?.name ?? "?"),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Surname:",
                    text2: _items?[index].user?.surname ?? "?"),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "E-mail:",
                    text2: _items?[index].user?.email ?? "?"),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Birthday:",
                    text2: _items?[index].user?.birthday ?? "?"),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Mobile Number:",
                    text2: _items?[index].user?.mobileNumber ?? "?"),
                MiddleInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Internal Phone Number:",
                    text2: _items?[index].user?.internalPhoneNumber ?? "?"),
                BottomInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Job:",
                    text2:
                        _items?[index].user?.titleName?.toLowerCase() ?? "?"),
                /* BottomInfoBox(
                    color: AppColors().grey,
                    width: width,
                    height: height,
                    text1: "Access Token:",
                    text2: _items?[index].token?.accessToken.toString() ?? "?"),*/
              ],
            ),
          );
        },
      ),
    );
  }
}

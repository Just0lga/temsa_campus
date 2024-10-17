import 'dart:io';
import 'package:dio/dio.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';
import 'package:temsa_campus/models/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalFormDetail.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalForms.dart';
import 'package:temsa_campus/services/Auth/get_Auth_Login.dart';
import 'package:temsa_campus/services/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/services/TechOnay/GetApprovalForms.dart';

class Fetch_TechOnay_GetApprovalFormDetail {
  final Dio _dio = Dio();

  List<TechOnay_GetAllProcessCount>? count;
  List<TechOnay_GetApprovalForms>? forms;
  List<AuthModel>? _items;

  final FetchService _fetchService1 = FetchService();
  final Fetch_TechOnay_GetAllProcessCount _fetchService2 =
      Fetch_TechOnay_GetAllProcessCount();
  final Fetch_TechOnay_GetApprovalForms _fetchService3 =
      Fetch_TechOnay_GetApprovalForms();

  Future<List<TechOnay_GetApprovalFormDetail>?>
      fetchPost_TechOnay_GetApprovalForms() async {
    try {
      //TOKENs
      _items = await _fetchService1.fetchPostItems(
          "https://360api.temsa.com/api/Auth/Login?userName=erdinc.ugurlu@temsa.com");
      final String token_info = "${_items?[0].token?.accessToken}";

      // COUNT
      count = await _fetchService2.fetchPost_TechOnay_GetAllProcessCount(
          "https://360api.temsa.com/api/TechOnay/GetAllProcessCount?email=erdinc.ugurlu@temsa.com");
      int? countofdatas = count?[0].data?.count;

      print("COUNT=${countofdatas}");

      // FORM
      forms = await _fetchService3.fetchPost_TechOnay_GetApprovalForms();
      print("FORMS=${forms}");

      // GET PROCESS ID and TUR
      List<String?> processIdList = [];
      List<String?> turList = [];

      if (forms != null) {
        for (var form in forms!) {
          if (form.data != null) {
            for (var data in form.data!) {
              processIdList.add(data.processId);
              turList.add(data.turu);
            }
          }
        }
      }

      int availableDataLength = processIdList.length;
      if (availableDataLength == 0) {
        print("No data available");
        return null;
      }

      // Use the minimum of available data length or the count of datas
      int fetchLength = availableDataLength < countofdatas!
          ? availableDataLength
          : countofdatas;

      for (int i = 0; i < fetchLength; i++) {
        print("$i. Process ID=${processIdList[i]} TUR=${turList[i]} ");
      }

      // Tech Onay
      List<TechOnay_GetApprovalFormDetail> detailsList = [];
      for (int i = 0; i < fetchLength; i++) {
        final response = await _dio.get(
            "https://360api.temsa.com/api/TechOnay/GetApprovalFormDetail?processId=${processIdList[i]}&tur=${turList[i]}",
            options: Options(headers: {
              'Authorization': 'Bearer $token_info',
            }));
        if (response.statusCode == HttpStatus.ok) {
          final data = response.data;
          if (data is Map<String, dynamic>) {
            detailsList.add(TechOnay_GetApprovalFormDetail.fromJson(data));
          }
        }
      }
      return detailsList;
    } catch (e) {
      print("Error fetching data: $e");
      print("GetApprovalFormDetail ERROR");
    }
    return null;
  }
}

/*import 'dart:io';
import 'package:dio/dio.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';
import 'package:temsa_campus/models/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalFormDetail.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalForms.dart';
import 'package:temsa_campus/services/Auth/get_Auth_Login.dart';
import 'package:temsa_campus/services/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/services/TechOnay/GetApprovalForms.dart';

class Fetch_TechOnay_GetApprovalFormDetail {
  final Dio _dio = Dio();

  List<TechOnay_GetAllProcessCount>? count;
  List<TechOnay_GetApprovalForms>? forms;
  List<AuthModel>? _items;

  final FetchService _fetchService1 = FetchService();
  final Fetch_TechOnay_GetAllProcessCount _fetchService2 =
      Fetch_TechOnay_GetAllProcessCount();
  final Fetch_TechOnay_GetApprovalForms _fetchService3 =
      Fetch_TechOnay_GetApprovalForms();

  Future<List<TechOnay_GetApprovalFormDetail>?>
      fetchPost_TechOnay_GetApprovalForms() async {
    try {
      //TOKENs
      _items = await _fetchService1.fetchPostItems(
          "https://360api.temsa.com/api/Auth/Login?userName=erdinc.ugurlu@temsa.com");
      final String token_info = "${_items?[0].token?.accessToken}";

      // COUNT
      count = await _fetchService2.fetchPost_TechOnay_GetAllProcessCount(
          "https://360api.temsa.com/api/TechOnay/GetAllProcessCount?email=erdinc.ugurlu@temsa.com");
      int? countofdatas = count?[0].data?.count;

      print("COUNT=${countofdatas}");

      // FORM
      forms = await _fetchService3.fetchPost_TechOnay_GetApprovalForms();
      print("FORMS=${forms}");

      // GET PROCESS ID and TUR
      List<String?> processIdList = [];
      List<String?> turList = [];

      if (forms != null) {
        for (var form in forms!) {
          if (form.data != null) {
            for (var data in form.data!) {
              processIdList.add(data.processId);
              turList.add(data.turu);
            }
          }
        }
      }
      print("0. Process ID=${processIdList[0]}+TUR=${turList[0]} ");
      print("1. Process ID=${processIdList[1]}+TUR=${turList[1]} ");
      print("2. Process ID=${processIdList[2]}+TUR=${turList[2]} ");
      print("3. Process ID=${processIdList[3]}+TUR=${turList[3]} ");
      print("4. Process ID=${processIdList[4]}+TUR=${turList[4]} ");
      print("5. Process ID=${processIdList[5]}+TUR=${turList[5]} ");
      print("6. Process ID=${processIdList[6]}+TUR=${turList[6]} ");

      //Tech Onay
      List<TechOnay_GetApprovalFormDetail> detailsList = [];
      for (int i = 0; i < 6; i++) {
        final response = await _dio.get(
            "https://360apitest.temsa.com/api/TechOnay/GetApprovalFormDetail?processId=${processIdList[i]}&tur=${turList[i]}",
            options: Options(headers: {
              'Authorization': 'Bearer $token_info',
            }));
        if (response.statusCode == HttpStatus.ok) {
          final data = response.data;
          if (data is Map<String, dynamic>) {
            detailsList.add(TechOnay_GetApprovalFormDetail.fromJson(data));
          }
        }
      }
      return detailsList;
    } catch (e) {
      print("Error fetching data: $e");
      print("GetApprovalFormDetail ERROR");
    }
    return null;
  }
}*/

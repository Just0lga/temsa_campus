import 'dart:io';
import 'package:dio/dio.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';
import 'package:temsa_campus/models/TechOnay/GetApprovalForms.dart';
import 'package:temsa_campus/services/Auth/get_Auth_Login.dart';

class Fetch_TechOnay_GetApprovalForms {
  final Dio _dio = Dio();

  List<AuthModel>? _items;
  final FetchService _fetchService = FetchService();

  Future<List<TechOnay_GetApprovalForms>?>
      fetchPost_TechOnay_GetApprovalForms() async {
    try {
      //TOKENs
      _items = await _fetchService.fetchPostItems(
          "https://360api.temsa.com/api/Auth/Login?userName=erdinc.ugurlu@temsa.com");

      final String token_info = "${_items?[0].token?.accessToken}";

      //Tech Onay
      final response = await _dio.get(
          "https://360api.temsa.com/api/TechOnay/GetApprovalForms?type=list",
          options: Options(headers: {
            'Authorization': 'Bearer $token_info',
          }));
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) {
          print("DATA İS LİST XXXX");
          return data
              .map((e) => TechOnay_GetApprovalForms.fromJson(e))
              .toList();
        } else if (data is Map<String, dynamic>) {
          print("DATA İS NOT LİST XXXX");

          return [TechOnay_GetApprovalForms.fromJson(data)];
        }
      }
    } catch (e) {
      print("GetApprovalForms ERROR");

      print("Error fetching data: $e");
    }
    return null;
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';
import 'package:temsa_campus/models/TechOnay/GetAllProcessCount.dart';
import 'package:temsa_campus/services/Auth/get_Auth_Login.dart';

class Fetch_TechOnay_GetAllProcessCount {
  final Dio _dio = Dio();

  List<AuthModel>? _items;
  final FetchService _fetchService = FetchService();

  Future<List<TechOnay_GetAllProcessCount>?>
      fetchPost_TechOnay_GetAllProcessCount(
    String url,
  ) async {
    try {
      //TOKEN
      _items = await _fetchService.fetchPostItems(
          "https://360api.temsa.com/api/Auth/Login?userName=erdinc.ugurlu@temsa.com");

      //Tech Onay
      final response = await _dio.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer ${_items?[0].token?.accessToken}',
          }));
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => TechOnay_GetAllProcessCount.fromJson(e))
              .toList();
        } else if (data is Map<String, dynamic>) {
          return [TechOnay_GetAllProcessCount.fromJson(data)];
        }
      }
    } catch (e) {
      print("GetAllProcessCount ERROR");
      print("Error fetching data: $e");
    }
    return null;
  }

  fetchPost_TechOnay_GetApprovalForms() {}
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:temsa_campus/models/Auth/Auth_Login.dart';

class FetchService {
  final Dio _dio = Dio();

  Future<List<AuthModel>?> fetchPostItems(
    String url,
  ) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => AuthModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [AuthModel.fromJson(data)];
        }
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return null;
  }
}

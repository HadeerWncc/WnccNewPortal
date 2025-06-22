import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'package:wncc_portal/core/constants/links.dart';

class ApiService {
  final Dio _dio =
      createDio(); // Create a Dio instance with your desired configuration

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? data,
  }) async {
    final response = await _dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Object? data,
  }) async {
    final response = await _dio.put('$baseUrl$endPoint', data: data);
    return response.data;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;
  String? token;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://bid.sa/', // Replace with your API base URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      validateStatus: (status) { // use if need error handling
        // Return true if the status code is either 200 or 422
        return status == 200 || status == 422;
      },
    ));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
    } catch (e) {
      throw Exception('Failed to perform GET request: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
    }
    catch (e) {
      log('Failed to perform POST $endpoint request: $e ');
      throw Exception('Failed to perform POST $endpoint request: $e');

    }
  }

  Future<Response<dynamic>> postMultipart(String endpoint, {FormData? formData, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: formData,
        queryParameters: queryParameters,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } catch (e) {
      log('Failed to perform POST $endpoint request: $e');
      throw Exception('Failed to perform POST $endpoint request: $e');
    }
  }

}
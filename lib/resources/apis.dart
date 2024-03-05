import 'dart:io';
import 'package:evolve/routers/app_routers.dart';

import 'utils.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiUrls{
  static const String domain = "https://bid.sa/";
  static const String baseUrl = "${domain}api/";

                        /*         <-- Api BaseUrl with endPoints -->         */

}

// api call methods

Future<http.Response> performGetRequest(String url) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer abc'
  };
  return await http.get(
    Uri.parse(url),
    headers: headers,
  );
}

Future<http.Response> performPostRequest(String url, Map<String, dynamic> map) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer abc'
  };
  return await http.post(
    Uri.parse(url),
    body: jsonEncode(map),
    headers: headers,
  );
}

void handleErrorCases(http.Response response, dynamic data, String apiName) {
  if (response.statusCode == 422) {
    // showToastError(data['Message']);
  }
  else if (response.statusCode == 400 || data['message'] == "Unauthenticated.") {
    print('coming in 400 or Unauthenticated in ${apiName}');
    clearLocalStorage();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
  // else {
  //   log('Yahaa aaya ApisUrl me');
  //   showToastError(data['message']);
  //   showLoader(false);
  //   throw Exception(response.body);
  // }
}


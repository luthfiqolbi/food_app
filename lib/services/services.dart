import 'dart:convert';
import 'dart:io';

import 'package:food_app/model/models.dart';
import 'package:http/http.dart' as http;

part 'food_service.dart';
part 'transaction_service.dart';
part "user_service.dart";

String baseUrl = "https://food.rtid73.com/api";

abstract class ApiServices {
  static headers({String? token}) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token ?? User.token}'
    };
  }

  static headersPost({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? User.token}'
    };
  }

  static Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers());

    if (response.statusCode != 200) {
      throw Exception('get $url Failed');
    }

    return response;
  }

  static Future<dynamic> post(String url, {dynamic body}) async {
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: headersPost(),
    );

    if(response.statusCode != 200) {
      throw Exception('post $url Failed');
    }

    return response;
  }
}

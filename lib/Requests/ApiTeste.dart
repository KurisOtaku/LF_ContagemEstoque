import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Request {
  final String url = "http://srvlf-app01/flutter/01.11.json";

  Future<String> getPortfolio_() async =>
      Dio().get(url).then((value) => null).catchError(print);

  Request() {}
  Future getPortfolio() async {
    return http.get(url);
  }
}

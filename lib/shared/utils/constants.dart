import 'package:dio/dio.dart';

class Constants {
  static String userToken = '';
  static String baseUrl = 'https://form-flutter-api-deck.onrender.com/api/';

  static Options get dioOptions =>
      Options(headers: {'authorization': 'Bearer $userToken'});
}

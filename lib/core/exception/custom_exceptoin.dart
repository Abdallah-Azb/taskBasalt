import 'package:dio/dio.dart';

class CustomException implements Exception {
  String cause;
  Response? response;

  CustomException(this.cause, {this.response});
}

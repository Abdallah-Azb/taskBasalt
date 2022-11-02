import 'package:dio/dio.dart';

class CustomResponse {
  bool success;
  String msg;
  int? statusCode;
  Response response;
  dynamic error;

  CustomResponse({
    required this.success,
    required this.msg,
    this.statusCode,
    required this.response,
    this.error,
  });
}

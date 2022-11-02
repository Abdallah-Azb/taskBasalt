import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_basalt/core/network_services/response_model.dart';

class ApiBaseHelper {
  // static const String url = 'BASE_URL';
  static const String url = '';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options, RequestInterceptorHandler requestInterceptorHandler) =>
                requestInterceptor(options),
            onError: (DioError e, ErrorInterceptorHandler errorInterceptorHandler) async {
              return e.response!.data;
            }),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    // options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<CustomResponse> get(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return CustomResponse(
          msg: 'suucess', response: response, success: true, error: null, statusCode: response.statusCode);
    } on DioError catch (e) {
      // Handle error
      return handleServerError(e);
    }
  }

  Future<CustomResponse> postHTTP(String url, dynamic data) async {
    Dio dio = Dio();

    // _dio.request(url,data: data);
    Response response;
    try {
      response = await dio.post(url, data: data, options: Options(followRedirects: false, validateStatus: (status) => true,));

      // Dio().post(url, data: data,);
      debugPrint("::: POST API::: CODE :: ${response.statusCode} :: URL :: $url :::");
      if(response.statusCode! >= 200 && response.statusCode! <300){
        return CustomResponse(
            msg: 'suucess', response: response, success: true, error: null, statusCode: response.statusCode);
      }else{
        return CustomResponse(
            msg: 'Un success', response: response, success: false, error: null, statusCode: response.statusCode);
      }

    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint("::: POST API::: CODE :: ${e.response!.statusCode} :: URL :: $url :::");
      }

      debugPrint(e.toString());
      // Handle error
      return handleServerError(e);
    }
  }
  Future<CustomResponse> getHTTP(String url) async {
    Dio dio = Dio();

    // _dio.request(url,data: data);
    Response response;
    try {
      response = await dio.get(url, options: Options(followRedirects: false, validateStatus: (status) => true,));

      // Dio().post(url, data: data,);
      debugPrint("::: Get API::: CODE :: ${response.statusCode} :: URL :: $url :::");
      if(response.statusCode! >= 200 && response.statusCode! <300){
        return CustomResponse(
            msg: 'suucess', response: response, success: true, error: null, statusCode: response.statusCode);
      }else{
        return CustomResponse(
            msg: 'Un success', response: response, success: false, error: null, statusCode: response.statusCode);
      }

    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint("::: POST API::: CODE :: ${e.response!.statusCode} :: URL :: $url :::");
      }

      debugPrint(e.toString());
      // Handle error
      return handleServerError(e);
    }
  }

  Future<CustomResponse> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);

      return CustomResponse(
          msg: 'suucess', response: response, success: true, error: null, statusCode: response.statusCode);
    } on DioError catch (e) {
      // Handle error
      return handleServerError(e);
    }
  }

  Future<CustomResponse> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return CustomResponse(
          msg: 'suucess', response: response, success: true, error: null, statusCode: response.statusCode);
    } on DioError catch (e) {
      // Handle error
      return handleServerError(e);
    }
  }

  CustomResponse handleServerError(DioError err) {
    debugPrint("===  handleServerError ==== ");
    debugPrint("== eerr  ==  ${err.message}");
    if (err.type == DioErrorType.response) // old ---> DioErrorType.RESPONSE
    {
      return CustomResponse(
        success: false,
        statusCode: err.response!.statusCode,
        msg: "Please check these errors and try again.",
        error: err.response!.data,
        response: err.response!,
      );
    } else if (err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException) //DioErrorType.DEFAULT
    {
      return CustomResponse(
        success: false,
        msg: "Please Check Your network Connection.",
        error: null,
        response: err.response!,
      );
    } else if (err.type == DioErrorType.other) {
      return CustomResponse(
        success: false,
        statusCode: err.response!.statusCode,
        msg: "Server Error, Please try again later.",
        error: null,
        response: err.response!,
      );
    } else {
      return CustomResponse(
        success: false,
        statusCode: err.response!.statusCode,
        msg: "Server Error, Please try again later.",
        error: null,
        response: err.response!,
      );
    }
  }
}

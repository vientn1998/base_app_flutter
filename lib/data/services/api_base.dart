import 'dart:io';

import 'package:base_app_flutter/app/import_file_global.dart';
import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/network/api_exceptions.dart';
import 'package:dio/dio.dart';

class BaseApi {
  Dio _dio = Dio();

  BaseApi() {
    _dio
      ..options.baseUrl = EndPoints.baseUrl
      ..options.connectTimeout = EndPoints.connectionTimeout
      ..options.receiveTimeout = EndPoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
      ))
      ..interceptors.add(Interceptor())
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options) {
          //getting token
          // options.headers.putIfAbsent("Authorization", () => "token");
        },
      ));
  }

  //Get
  Future<dynamic> get(String uri,
      {Map<String, dynamic> queryParameters,
      bool useToken = true,
      ProgressCallback onReceiverProgress}) async {
    try {
      final Response response = await _dio.get(EndPoints.baseUrl + uri,
          queryParameters: queryParameters,
          options: Options(headers: getHeader(useToken: true)),
          onReceiveProgress: onReceiverProgress);
      return response;
    } catch (e) {
      print("error get: $e");
      if (e is DioError) {
        if (e.response.statusCode == 404) {
          throw ServiceException(
              statusCode: 404, message: "Http status error [404]");
        } else {
          throw ServiceException(
              statusCode: 404, message: DioErrorUtil.handleError(e));
        }
      } else {
        throw e;
      }
    }
  }

  //Post
  Future<dynamic> post(
      {String uri,
      data,
      Map<String, dynamic> queryParameters,
      Options options,
      bool useToken = true,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: getHeader(useToken: false)),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 404) {
          throw ServiceException(
              statusCode: 404, message: "Http status error [404]");
        }
      } else {
        throw e;
      }
    }
  }

  Map<String, String> getHeader({bool useToken = true}) {
    return useToken
        ? {
            HttpHeaders.contentTypeHeader: "application/json",
            "Authorization": "Bearer $token"
          }
        : {HttpHeaders.contentTypeHeader: "application/json"};
  }
}

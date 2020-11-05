import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/models/base_object.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

import 'api_exceptions.dart';

class DioClient {

  //dio instance
  final Dio _dio;

  //injecting dio instance
  DioClient(this._dio);

  //Get
  Future<dynamic> get(
      String uri,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onReceiverProgress}) async{
    try {
      final Response response = await _dio.get(
        EndPoints.baseUrl + uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress
      );
      return response.data;
    } catch (e) {
      print("error get: $e");
      if (e is DioError) {
        if (e.response.statusCode == 404) {
          throw NetworkException(statusCode: 404, message: "Http status error [404]");
        }
      } else {
        throw e;
      }
    }
  }

  //Post
  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress}
      ) async {
    try {
      final Response response = await _dio.post(
        EndPoints.baseUrl + uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress
      );
      if (response == null || response.statusCode < 200 || response.statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: response.statusCode);
      }
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
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
        request: false,
        requestBody: false,
        responseBody: false,
        requestHeader: false,
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
      Options options,
      ProgressCallback onReceiverProgress}) async {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = "application/json";
    _headers['Authorization'] = "token";
    if (useToken) {
      options..headers = _headers;
    }
    try {
      final Response response = await _dio.get(EndPoints.baseUrl + uri,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiverProgress);
      return response.data;
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
  Future<dynamic> post(String uri,
      {data,
      Map<String, dynamic> queryParameters,
      Options options,
      bool useToken = true,
      ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = "application/json";
    _headers['Authorization'] = "token";
    if (useToken) {
      options..headers = _headers;
    }
    try {
      final Response response = await _dio.post(EndPoints.baseUrl + uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (e) {
      print("error get: $e");
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
}

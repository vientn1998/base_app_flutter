import 'dart:convert';

import 'package:base_app_flutter/app/import_file_global.dart';
import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/services/api_base.dart';
import 'package:base_app_flutter/data/services/api_responese.dart';
import 'package:base_app_flutter/models/base_object.dart';
import 'package:base_app_flutter/models/user_obj.dart';
import 'package:dio/dio.dart';

class LoginRespository {
  BaseApi _baseApi = getIt<BaseApi>();

  login() async {
    try {
      final Response response = await _baseApi.post(
          uri: EndPoints.login,
          data: {
            "email": "dcmen69@yopmail.com",
            "password": "e10adc3949ba59abbe56e057f20f883e",
            "accountType": "Normal"
          },
          useToken: false);
      final baseOut =
          BaseResponse<UserObj>().pareJson(response.data, UserObj());
      return ApiResponse.returnResponse(response, baseOut.data as UserObj);
    } catch (error, stacktrace) {
      print("err: $error");
      print("stacktrace: $stacktrace");
      return ApiResponse.error(
          errorCode: 555,
          errorMsg: error.toString(),
          errorBdy: stacktrace.toString(),
          data: null);
    }
  }

  getUserDetail() async {
    try {
      final Response response = await _baseApi.get(EndPoints.getUserDetails);
      final baseOut =
          BaseResponse<UserObj>().pareJson(response.data, UserObj());
      return ApiResponse.returnResponse(response, baseOut.data as UserObj);
    } catch (ex, stacktrace) {
      print("err: $ex");
      print("stacktrace: $stacktrace");
      return ApiResponse.error(
          errorCode: 555,
          errorMsg: ex.toString(),
          errorBdy: stacktrace.toString(),
          data: null);
    }
  }
}

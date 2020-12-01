import 'package:base_app_flutter/enum/app_enum.dart';
import 'package:dio/dio.dart';

import 'api_error.dart';

class ApiResponse<T> {
  ApiStatus status;
  T data;
  String message;
  ApiError apiError;

  ApiResponse({this.status, this.data, this.apiError, this.message});

  static ApiResponse<T> loading<T>() {
    return ApiResponse<T>(status: ApiStatus.LOADING, data: null);
  }

  static ApiResponse<T> success<T>(T data) {
    return ApiResponse<T>(status: ApiStatus.COMPLETED, data: data);
  }

  static ApiResponse<T> error<T>(
      {int errorCode, String errorMsg, String errorBdy, T data}) {
    var apiError = ApiError(
        statusCode: errorCode,
        errorMessage: errorMsg,
        errorBody: errorBdy == null ? "" : errorBdy);
    return ApiResponse<T>(
        status: ApiStatus.ERROR, apiError: apiError, data: data);
  }

  static ApiResponse<T> returnResponse<T>(Response response, T data) {
    if (response.statusCode == 200) {
      return ApiResponse.success(data);
    } else if (response.statusCode == 999) {
      return ApiResponse.error(
          errorCode: response.statusCode, errorMsg: "No internet", data: null);
    } else {
      return ApiResponse.error(
          errorCode: response.statusCode,
          errorMsg: response.statusMessage,
          errorBdy: response.data.toString(),
          data: null);
    }
  }

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}

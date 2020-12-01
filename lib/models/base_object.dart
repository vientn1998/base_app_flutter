import 'package:base_app_flutter/models/post.dart';

abstract class BaseObject<T> {
  fromJson(json);
}

class BaseResponse<T> {
  bool status;
  String message;
  T data;

  BaseResponse({this.status, this.message, this.data});

  BaseResponse pareJson(dynamic json, BaseObject target) {
    print("data $json");
    return BaseResponse(
      status: json["status"],
      message: json["message"],
      data: target.fromJson(json["data"]),
    );
  }

  BaseResponse pareJsonPost(dynamic json, BaseObject target) {
    final data = json;
    return BaseResponse(
      data: target.fromJson(data),
    );
  }
}

class BaseListResponse<T> {
  int status;
  String message;
  List<T> data;

  BaseListResponse({this.status, this.message, this.data});

  BaseListResponse pareJsonArrayPost(dynamic json, BaseObject target) {
    final list = json as List ?? [];
    print("listCount: ${list.length}");
    print((target.fromJson(json[0]) as Post).userId);
    final listData = list.map<T>((json) => target.fromJson(json)).toList();
    return BaseListResponse(
      data: listData,
    );
  }
}

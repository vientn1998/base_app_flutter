abstract class BaseObject<T> {
  fromJson(json);
}

class BaseResponse<T> {

  int status;
  String message;
  T data;

  BaseResponse({this.status, this.message, this.data});

  BaseResponse pareJson(dynamic json, BaseObject target) {
    return BaseResponse(
      status: json["status"],
      message: json["message"],
      data: target.fromJson(json["data"]),
    );
  }
}
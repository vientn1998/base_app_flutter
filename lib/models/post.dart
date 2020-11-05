import 'package:base_app_flutter/models/base_object.dart';

class Post extends BaseObject<Post>{
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
    "userId": this.userId,
    "id": this.id,
    "title": this.title,
    "body": this.body,
  };

  @override
  Post fromJson(json) {
    return Post.fromJson(json);
  }
}

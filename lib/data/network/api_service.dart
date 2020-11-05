import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/network/api_exceptions.dart';
import 'package:base_app_flutter/data/network/dio_client.dart';
import 'package:base_app_flutter/models/base_object.dart';
import 'package:base_app_flutter/models/post.dart';

class ApiService {

  //dio instance
  final DioClient _dioClient;

  //injecting dio instance
  ApiService(this._dioClient);

  //return list of post in response
  Future<List<Post>> getListPost() async {
    try {
      final res = await _dioClient.get(EndPoints.getPosts);

    } on NetworkException{
      print("error");
    } catch(e) {
      print("error getListPost: ${e.toString()}");
      throw e;
    }
  }

  //return post in response
  Future<Post> getPost(String postId) async {
    try {
      final res = await _dioClient.get(EndPoints.getPosts + "/" + postId);
      return BaseResponse<Post>().pareJson(res, Post()).data;
    }catch(e) {
      print("error getPost: ${e.toString()}");
      throw e;
    }
  }
}
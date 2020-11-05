import 'package:base_app_flutter/data/network/api_endpoints.dart';
import 'package:base_app_flutter/data/network/dio_client.dart';
import 'package:base_app_flutter/models/base_object.dart';
import 'package:base_app_flutter/models/post.dart';

class ApiService {

  //dio instance
  final DioClient _dioClient;

  //injecting dio instance
  ApiService(this._dioClient);

  //TODO: get posts
  Future<List<Post>> getListPost() async {
    try {
      final res = await _dioClient.get(EndPoints.getPosts, queryParameters: {
        "_page": 0,
        "_limit": 1
      });
      print(res);
      final response = BaseListResponse<Post>().pareJsonArrayPost(res, Post());
      return response.data;
    } catch(e) {
      throw e;
    }
  }

  //TODO get post
  Future<Post> getPost(int postId) async {
    try {
      final res = await _dioClient.get(EndPoints.getPosts + "/$postId");
      return BaseResponse<Post>().pareJsonPost(res, Post()).data;
    }catch(e) {
      throw e;
    }
  }

  //TODO: create post
  Future<Post> createPost(Post post) async {
    try {
      final res = await _dioClient.post(EndPoints.createPost, data: post.toJson());
      return BaseResponse<Post>().pareJsonPost(res, Post()).data;
    }catch(e) {
      throw e;
    }
  }
}
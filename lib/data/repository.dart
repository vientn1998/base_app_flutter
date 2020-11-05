import 'package:base_app_flutter/data/network/api_service.dart';
import 'package:base_app_flutter/models/post.dart';

class Repository {

  //api object
  final ApiService _apiService;

  //constructor
  Repository(this._apiService);

  //Get ListPost
  Future<List<Post>> getPosts() async{
    return await _apiService.getListPost().then((list) {
      return list;
    }).catchError((error) {
      throw error;
    });
  }

  //Get Post
  Future<Post> getPost(int postId) async{
    return await _apiService.getPost(postId)
        .then((post) => post)
        .catchError((error) {
      throw error;
    });
  }
}
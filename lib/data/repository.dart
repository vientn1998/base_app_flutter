import 'package:base_app_flutter/data/network/api_service.dart';

class Repository {

  //api object
  final ApiService _apiService;

  //constructor
  Repository(this._apiService);

  //Get ListPost
  Future<dynamic> getPosts() async{
    return await _apiService.getListPost().then((list) {
      return list;
    }).catchError((error) {
      throw error;
    });
  }

}
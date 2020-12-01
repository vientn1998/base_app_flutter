class EndPoints {
  EndPoints._();
  // base url
  // static const String baseUrl = "http://jsonplaceholder.typicode.com";
  static const String baseUrl = "http://124.47.187.233:82/api/";

  static const String login = "login";
  static const String getUserDetails = "user/get";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // get posts
  static const String getPosts = "/posts";

  // create post
  static const String createPost = "/posts";
}

class EndPoints {
  EndPoints._();
  // base url
  static const String baseUrl = "http://jsonplaceholder.typicode.com";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // get posts
  static const String getPosts = "/posts";

  // create post
  static const String createPost = "/posts";
}
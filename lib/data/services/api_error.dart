class ApiError {
  int statusCode;
  String errorMessage;
  String errorBody;
  ApiError({this.statusCode, this.errorMessage, this.errorBody});
}

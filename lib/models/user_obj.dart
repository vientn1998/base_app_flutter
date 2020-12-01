import 'base_object.dart';

class UserObj extends BaseObject<UserObj> {
  final String id;
  final String userId;
  final String fullName;
  final String jwtToken;

  UserObj({this.id, this.userId, this.fullName, this.jwtToken});

  factory UserObj.fromJson(Map<String, dynamic> json) {
    return UserObj(
      userId: json['userId'],
      id: json['id'],
      fullName: json['fullName'],
      jwtToken: json['jwtToken'],
    );
  }

  @override
  fromJson(json) {
    return UserObj.fromJson(json);
  }

  @override
  String toString() {
    return "id: $id\nname: $fullName\njwtToken: $jwtToken";
  }
}

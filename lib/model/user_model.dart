import 'dart:convert';

List<Users> productModelsFromJson(String str) =>
    List<Users>.from(
        json.decode(str).map((x) => Users.fromJson(x)));

String productModelsToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




class Users {
  Users({
    this.userNumber,
    required this.userName,
    required this.userPhone,
    required this.description,
    required this.imageUrl,
  });

  String? userNumber;
  final String userName;
  final String userPhone;
  final String description;
  String imageUrl;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userNumber: json["userNumber"],
    userName: json["userName"],
    userPhone: json["userPhone"],
    description: json["description"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "userNumber": userNumber,
    "userName": userName,
    "userPhone": userPhone,
    "description": description,
    "imageUrl": imageUrl,
  };
}
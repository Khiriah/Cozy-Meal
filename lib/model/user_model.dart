//
//
// import 'dart:convert';
//
// List<UserModel> productModelsFromJson(String str) =>
//     List<UserModel>.from(
//         json.decode(str).map((x) => UserModel.fromJson(x)));
//
// String productModelsToJson(List<UserModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
//
//
//
// class UserModel {
//   String? uid;
//   String? name;
//   String? email;
//   String? password;
//   String? image;
//
//   UserModel({
//     this.uid,
//     this.name,
//     this.email,
//     this.password,
//     this.image
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       UserModel(
//         uid: json["id"],
//         name: json["name"],
//         email: json["email"],
//         password: json["password"],
//         image: json["image"],
//
//       );
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       'uid': uid,
//       'name': name,
//       'email': email,
//       'password': password,
//       'image': image,
//
//     };
//   }
// }
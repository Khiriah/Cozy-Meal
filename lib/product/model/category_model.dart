import 'dart:convert';
import 'dart:convert';

List<String> categoryModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoryModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

// class CategoryModel {
//   CategoryModel({
//     this.IDNumber,
//     required this.categoryName,
//     required this.imageUrl,
//   });
//
//   String? IDNumber;
//   final String categoryName;
//   String imageUrl;
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//     IDNumber: json["productNumber"],
//     categoryName: json["productName"],
//     imageUrl: json["imageUrl"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "productNumber": IDNumber,
//     "productName": categoryName,
//     "imageUrl": imageUrl,
//   };
// }

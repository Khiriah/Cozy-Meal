import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  final Prodect productModels;
  const ListScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: mainColor,
      title: Text(
        productModels.category,
        style: TextStyle(color: googleColor),
      ),
      centerTitle: true,
    ),
    backgroundColor: context.theme.backgroundColor,
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    child: Image.network(
    productModels.imageUrl,
    fit: BoxFit.cover,
    ),
    ),
   ] )
    )
    )
    );
  }
}

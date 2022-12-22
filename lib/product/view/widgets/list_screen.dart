import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  final Product productModels;
  const ListScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              title: Text(
                productModels.category,
                style: const TextStyle(color: googleColor),
              ),
              centerTitle: true,
            ),
            backgroundColor: context.theme.backgroundColor,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Image.network(
                    productModels.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ]))));
  }
}

import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:cozy_meal/views/widgets/product/cart/card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresScreen extends StatelessWidget {

  const StoresScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: context.theme.backgroundColor,
      title: Text(
        "productModels.category",
        style: TextStyle(color: googleColor),
      ),
      centerTitle: true,
    ),
    backgroundColor: context.theme.backgroundColor,
    body: SingleChildScrollView(
     child: CardItems()
     )
    ));
  }
}

import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:cozy_meal/views/screens/datiles/add_cart.dart';
import 'package:cozy_meal/views/screens/datiles/clothes_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DatilesScreen extends StatelessWidget {
  final Prodect productModels;

  DatilesScreen({Key? key, required this.productModels}) : super(key: key);

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
              ClothesInfo(
                  productName: productModels.productName,
                  catagory: productModels.category,
                  image: productModels.imageUrl,
                  price: productModels.price,
                  productId: productModels.productNumber.toString(),
                  title: productModels.productName,
                  description: productModels.description,
                  productModels: productModels),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: AddCart(
                  price: productModels.price,
                  productModels: productModels,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

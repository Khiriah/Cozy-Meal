import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/product/view/screens/details/add_cart.dart';
import 'package:cozy_meal/product/view/screens/details/product_info.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DetailsScreen extends StatelessWidget {
  final Product productModels;

  const DetailsScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            productModels.productName,
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
              SizedBox(
                height: 360,
                child: SingleChildScrollView(
                  child: ProductInfo(
                      productName: productModels.productName,
                      category: productModels.category,
                      image: productModels.imageUrl,
                      price: productModels.price,
                      productId: productModels.productNumber.toString(),
                      title: productModels.productName,
                      description: productModels.description,
                      productModels: productModels),
                ),
              ),
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

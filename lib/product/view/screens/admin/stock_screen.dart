import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/product/view/screens/admin/empty_screen.dart';
import 'package:cozy_meal/product/view/widgets/product/products_in_stock.dart';
import 'package:cozy_meal/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockScreen extends StatelessWidget {
  StockScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: const []),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(Routes.addProductFromScreen);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: controller.getData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.prodects = snapshot.data!.docs
                  .map((e) => Product(
                      productNumber: e['productNumber'],
                      productName: e['productName'],
                      description: e['description'],
                      category: e['category'],
                      price: e['price'],
                      quantity: e['quantity'],
                      imageUrl: e['imageUrl']))
                  .toList();
              if (controller.prodects.isNotEmpty) {
                return ProuctsInStock(
                  prodect: controller.prodects,
                );
              } else {
                return const EmptyScreen();
              }
            } else {
              return ProuctsInStock(
                prodect: controller.prodects,
              );
            }
          }),
    );
  }
}

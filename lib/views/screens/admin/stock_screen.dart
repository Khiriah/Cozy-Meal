import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/views/screens/admin/empty_screen.dart';
import 'package:cozy_meal/views/widgets/product/prouctsIn_stock.dart';
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
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(Routes.addProductFromScreen);
            },
            icon: Icon(
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
              print("not empty screen");
              controller.prodects = snapshot.data!.docs
                  .map((e) => Prodect(
                      productNumber: e['productNumber'],
                      productName: e['productName'],
                      description: e['description'],
                      category: e['category'],
                      price: e['price'],
                      quantity: e['quantity'],
                      imageUrl: e['imageUrl']))
                  .toList();
              print("prodects.length   ${controller.prodects.length}");

              if (controller.prodects.isNotEmpty) {
                return ProuctsInStock(
                  prodect: controller.prodects,
                );
              } else {
                print("empty screen");
                return EmptyScreen();
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

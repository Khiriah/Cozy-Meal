import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/views/screens/admin/empty_screen.dart';
import 'package:cozy_meal/views/widgets/product/prouctsIn_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidjet extends StatelessWidget {
  ProductListWidjet({Key? key}) : super(key: key);
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
return GetBuilder<ProductController>(builder: (_){
  return ListWheelScrollView.useDelegate(
    itemExtent: 250,
    childDelegate: ListWheelChildBuilderDelegate(
        childCount: productController.prodects.length,
        builder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {

              },
              child:
              StreamBuilder(
                  stream: productController.getData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("not empty screen");
                      productController.prodects = snapshot.data!.docs
                          .map((e) => Prodect(
                          productNumber: e['productNumber'],
                          productName: e['productName'],
                          description: e['description'],
                          category: e['category'],
                          price: e['price'],
                          quantity: e['quantity'],
                          imageUrl: e['imageUrl']))
                          .toList();
                      print("prodects.length   ${productController.prodects.length}");

                      if (productController.prodects.isNotEmpty) {
                        return ProuctsInStock(
                          prodect: productController.prodects,
                        );
                      } else {
                        print("empty screen");
                        return EmptyScreen();
                      }
                    } else {
                      return ProuctsInStock(
                        prodect: productController.prodects,
                      );
                    }
                  }),
          );
        }

    ),
  );
});



  }
  }

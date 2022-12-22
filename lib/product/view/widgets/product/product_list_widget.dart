import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/product/view/screens/admin/empty_screen.dart';
import 'package:cozy_meal/product/view/widgets/product/products_in_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key}) : super(key: key);
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return ListWheelScrollView.useDelegate(
        itemExtent: 250,
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: productController.prodects.length,
            builder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: StreamBuilder(
                    stream: productController.getData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        productController.prodects = snapshot.data!.docs
                            .map((e) => Product(
                                productNumber: e['productNumber'],
                                productName: e['productName'],
                                description: e['description'],
                                category: e['category'],
                                price: e['price'],
                                quantity: e['quantity'],
                                imageUrl: e['imageUrl']))
                            .toList();

                        if (productController.prodects.isNotEmpty) {
                          return ProuctsInStock(
                            prodect: productController.prodects,
                          );
                        } else {
                          return const EmptyScreen();
                        }
                      } else {
                        return ProuctsInStock(
                          prodect: productController.prodects,
                        );
                      }
                    }),
              );
            }),
      );
    });
  }
}

import 'package:cozy_meal/logic/controllers/cart_controller.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:cozy_meal/views/widgets/product/cart/cart_product_card.dart';
import 'package:cozy_meal/views/widgets/product/cart/cart_total.dart';
import 'package:cozy_meal/views/widgets/product/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? mainColor  :Colors.grey ,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
              () {
            if (controller.cartsList.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            productModels:
                            controller.cartsList.keys.toList()[index],
                            quantity:
                            controller.cartsList.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.cartsList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
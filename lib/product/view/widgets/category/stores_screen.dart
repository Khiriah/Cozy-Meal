import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/product/view/widgets/product/card_item_horizontal.dart';
import 'package:cozy_meal/product/view/widgets/product/card_items.dart';
import 'package:cozy_meal/product/view/widgets/search_form_text.dart';
import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoresScreen extends StatelessWidget {
  StoresScreen ({super.key, required, });
final controller = Get.put(ProductController());
final authController = Get.find<AuthController>();
@override
Widget build(BuildContext context) {
  return Container(
    color: context.theme.backgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          decoration: Get.isDarkMode
              ? const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: [
                    googleColor,
                    mainColor,
                    mainColor,
                    mainColor,
                    mainColor,
                    mainColor,
                    mainColor
                  ]))
              : BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: const Alignment(0.8, 1),
                  colors: [
                    googleColor,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                  ])),
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Get.isDarkMode ? Colors.grey : mainColor,
                ),
                Text(
                  "Deliver to",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.grey : mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "  Home",
                  style: TextStyle(
                      color: googleColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  padding: const EdgeInsets.only(
                      top: 50, left: 15, right: 15, bottom: 15),
                  child: SearchProducts()),
              const SizedBox(
                height: 10,
              ),
            ])
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils(
              text: "Stores",
              color: Get.isDarkMode ? Colors.white : mainColor,
              fontWeight: FontWeight.bold,
              fontsize: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.to(StoresScreen());
                },
                child: TextUtils(
                  color: Get.isDarkMode ? Colors.white : mainColor,
                  text: 'See All',
                  fontWeight: FontWeight.bold,
                  fontsize: 20,
                  underLine: TextDecoration.underline,
                ))
          ],
        ),
        StreamBuilder(
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
                return CardItemsHorizontal();
              } else {
                return const Text("No thing");
              }
            } else {
              return CardItemsHorizontal();
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils(
              text: "Exclusive Offers",
              color: Get.isDarkMode ? Colors.white : mainColor,
              fontWeight: FontWeight.bold,
              fontsize: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => StoresScreen());
                },
                child: TextUtils(
                  color: Get.isDarkMode ? Colors.white : mainColor,
                  text: 'See All',
                  fontWeight: FontWeight.bold,
                  fontsize: 20,
                  underLine: TextDecoration.underline,
                ))
          ],
        ),
        StreamBuilder(
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
                return CardItems();
              } else {
                return const Text("No thing");
              }
            } else {
              return CardItems();
            }
          },
        ),
      ],
    ),
  );
}
}

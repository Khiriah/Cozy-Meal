import 'package:cozy_meal/logic/controllers/cart_controller.dart';
import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemsHorizontal extends StatelessWidget {
  CardItemsHorizontal({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: controller.searchList.isEmpty &&
            controller.searchTextController.text.isNotEmpty
            ? Get.isDarkMode
            ? Icon(Icons.search_off_outlined,size: 300,color:Colors.grey ,)
            : Icon(Icons.search_off_outlined,size: 300,color: googleColor,)
            : GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.searchList.isEmpty
              ? controller.prodects.length
              : controller.searchList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1,
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 6.0,
            maxCrossAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            if (controller.searchList.isEmpty) {
              return buildCardItems(
                  category: controller.prodects[index].category,
                  productName: controller.prodects[index].productName,
                  image: controller.prodects[index].imageUrl,
                  price: controller.prodects[index].price,
                  productId:
                  controller.prodects[index].productNumber.toString(),
                  productModels: controller.prodects[index],
                  onTap: () {
                    // Get.to(() => ProductDetailsScreen(
                    //   productModels: controller.productList[index],
                    // ));k
                  });
            } else {
              return buildCardItems(
                  productName: controller.searchList[index].productName,
                  category: controller.searchList[index].category,
                  image: controller.searchList[index].imageUrl,
                  price: controller.searchList[index].price,
                  productId: controller.searchList[index].productNumber
                      .toString(),
                  productModels: controller.searchList[index],
                  onTap: () {
                    // Get.to(() => ProductDetailsScreen(
                    //   productModels: controller.searchList[index],
                    // ));
                  });
            }
          },
        ),
      );
    });
  }

  Widget buildCardItems({
    required String productName,
    required String image,
    required String category,
    required double price,
    required String productId,
    required Prodect productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: mainColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                children: [Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                  IconButton(
                    onPressed: () {
                      controller.manageFavourites(productId);
                    },
                    icon: controller.isFave(productId)
                        ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                        : const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
              ]),
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: " $productName", color: Colors.white,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none, fontsize: 13,
                    ),

                    // IconButton(
                    //   onPressed: () {
                    //     cartController.addProductToCart(productModels);
                    //   },
                    //   icon: const Icon(
                    //     Icons.shopping_cart,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),

              ),
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: " $category", color: Colors.white,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none, fontsize: 13,
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     cartController.addProductToCart(productModels);
                    //   },
                    //   icon: const Icon(
                    //     Icons.shopping_cart,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),

              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextUtils(
                      fontWeight: FontWeight.bold,
                      text: "******",
                      color: googleColor,
                      underLine: TextDecoration.none, fontsize: 13,
                    ),
                    ]),

                ),

            ],
          ),
        ),
      ),
    );
  }
}
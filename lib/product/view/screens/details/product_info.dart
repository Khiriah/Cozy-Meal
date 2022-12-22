import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String description;
  final String productName;
  final  String category;
  final  String image;
  final double price;
  final String productId;
  final Product productModels;
  ProductInfo({
    required this.productName,
    required this.category,
    required this.image,
    required this.price,
    required this.productId,
    Key? key,
    required this.title,
    required this.description, required this.productModels,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => IconButton(onPressed: (){
                  controller.addFavouriteToFirstore(productModels);}, icon: controller.isFavorite.value
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color:  googleColor,
                            size: 20,
                          ),),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                fontsize: 14,
                fontWeight: FontWeight.bold,
                text: "*****",
                color:googleColor,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),

          ReadMoreText(
            description,
            trimLines: 1,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color:googleColor,
            ),
            moreStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: googleColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            height: 250,
          ),
        ],
      ),
    );
  }
}

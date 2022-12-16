import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class PrudectInfo extends StatelessWidget {
  final String title;
  final String description;
  final String productName;
  final  String catagory;
  final  String image;
  final double price;
  final String productId;
  final Prodect productModels;
  PrudectInfo({
    required this.productName,
    required this.catagory,
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
                () => Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.addProdectToFirstore(productModels);
                    },
                    child: controller.isFave(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
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
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color:googleColor,
            ),
            moreStyle: TextStyle(
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

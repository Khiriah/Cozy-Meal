import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteWidget extends StatelessWidget {

  FavoriteWidget ({super.key, required, required this.productModels, });
  final controller = Get.find<ProductController>();
 List <dynamic> productModels;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: productModels.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
              height: 178,
              width: 393,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Get.isDarkMode? mainColor:Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 156,
                    width: 99,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode? Colors.white:Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: NetworkImage('${productModels[index]['imageUrl']}'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${productModels[index]['productName']}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: googleColor),
                        ),
                        Text(
                          "Category : ${productModels[index]['category']}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:  Colors.white),
                        ),
                          Text(" \$${productModels[index]['price']}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: googleColor)
                          ),
                          const SizedBox(height: 5,),
                        ]),
                    ),
                  IconButton(onPressed: (){
                   controller.DeleteFavoret(productModels[index]['productNumber']);
                  }, icon: const Icon(Icons.delete,color: googleColor,))],
              ),
            );
          }
          )
      ),
    );
  }
}

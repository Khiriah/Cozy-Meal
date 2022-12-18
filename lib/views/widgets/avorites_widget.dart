import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/model/puppMenu.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteWidget extends StatelessWidget {

  FavoriteWidget ({super.key, required, required this.prodectModels, });
  final controller = Get.find<ProductController>();
 List <dynamic> prodectModels;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: prodectModels.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5),
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
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode? Colors.white:Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: NetworkImage('${prodectModels[index]['imageUrl']}'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${prodectModels[index]['productName']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: googleColor),
                        ),
                        Text(
                          "Category : ${prodectModels[index]['category']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:  Colors.white),
                        ),
                          Text(" \$${prodectModels[index]['price']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: googleColor)
                          ),
                          SizedBox(height: 5,),
                        ]),
                    ),
                  IconButton(onPressed: (){
                   controller.deletefavoret(prodectModels[index]['productNumber']);
                  }, icon: Icon(Icons.delete,color: googleColor,))],
              ),
            );
          }
          )
      ),
    );
  }
}

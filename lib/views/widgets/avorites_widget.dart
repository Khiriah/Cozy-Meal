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
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    height: 156,
                    width: 99,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: NetworkImage('${prodectModels[index]['imageUrl']}'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          "${prodectModels[index]['productName']}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        Text(
                          "${prodectModels[index]['category']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        Text(
                          "${prodectModels[index]['quantity']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                          Text("\$${prodectModels[index]['price']}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 1))
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

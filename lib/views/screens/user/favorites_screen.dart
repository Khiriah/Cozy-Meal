import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/views/widgets/product/empty_favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  Obx(
            () => Scaffold(
                backgroundColor: context.theme.backgroundColor,
        body: controller.favouritesList.isNotEmpty
            ? ListView.builder(
            itemCount: controller.favouritesList.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                height: 138,
                width: 393,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      height: 106,
                      width: 96,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${controller.favouritesList[index].imageUrl}'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "${controller.favouritesList[index].productName}",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                // PopupMenu1(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${controller.favouritesList[index].category}",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(children: [
                            Text(
                                "\$${controller.favouritesList[index].price}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                            Spacer(),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }))
            : EmptyFavorites()));
  }
}

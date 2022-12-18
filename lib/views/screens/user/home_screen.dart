import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cozy_meal/logic/controllers/auth_controller.dart';
import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:cozy_meal/views/widgets/product/cart/card_items.dart';
import 'package:cozy_meal/views/widgets/product/cart/card_item_horzintal.dart';
import 'package:cozy_meal/views/widgets/product/catagory/stores_screen.dart';
import 'package:cozy_meal/views/widgets/product/search_form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
          color: context.theme.backgroundColor,
          width: double.infinity,
          height:Get.height   ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: Get.isDarkMode
                    ? BoxDecoration(
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
                            end: Alignment(0.8, 1),
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
                      Text(
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
                        padding: EdgeInsets.only(
                            top: 50, left: 15, right: 15, bottom: 15),
                        child: SearchProducts()),

                    CarouselSlider(items:controller.imageListSlider.map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(e,
                            height: 200,
                            width: 100,
                            fit: BoxFit.cover,)
                        ],
                      ),
                    )).toList() , options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      height: 150,
                    ),),


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
                    fontsize: 13,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.storesScreen);
                      },
                      child: TextUtils(
                        color: Get.isDarkMode ? Colors.white : mainColor,
                        text: 'See All',
                        fontWeight: FontWeight.bold,
                        fontsize: 13,
                        underLine: TextDecoration.underline,
                      ))
                ],
              ),
              StreamBuilder(
                stream: controller.getData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.prodects = snapshot.data!.docs
                        .map((e) => Prodect(
                            productNumber: e['productNumber'],
                            productName: e['productName'],
                            description: e['description'],
                            category: e['category'],
                            price: e['price'],
                            quantity: e['quantity'],
                            imageUrl: e['imageUrl']))
                        .toList();

                    print('leeength ${controller.prodects.length}');
                    if (controller.prodects.isNotEmpty) {
                      return CardItemsHorizontal();
                    } else {
                      return Text("No thing");
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
                    fontsize: 13,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.storesScreen);
                      },
                      child: TextUtils(
                        color: Get.isDarkMode ? Colors.white : mainColor,
                        text: 'See All',
                        fontWeight: FontWeight.bold,
                        fontsize: 13,
                        underLine: TextDecoration.underline,
                      ))
                ],
              ),
              StreamBuilder(
                stream: controller.getData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.prodects = snapshot.data!.docs
                        .map((e) => Prodect(
                            productNumber: e['productNumber'],
                            productName: e['productName'],
                            description: e['description'],
                            category: e['category'],
                            price: e['price'],
                            quantity: e['quantity'],
                            imageUrl: e['imageUrl']))
                        .toList();
                    print('leeength ${controller.prodects.length}');
                    if (controller.prodects.isNotEmpty) {
                      return CardItems();
                    } else {
                      return Text("No thing");
                    }
                  } else {
                    return CardItems();
                  }
                },
              ),
            ],
          ),

      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:cozy_meal/logic/controllers/cart_controller.dart';
import 'package:cozy_meal/logic/controllers/main_controller.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: mainColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                  () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: googleColor),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Icon(Icons.shopping_cart,color: googleColor,),
                    ),
                  ),
                ),
              ],
              backgroundColor:mainColor ,
              title: Text(controller.title[controller.currentIndex.value],style: TextStyle(color: googleColor),),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: mainColor,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color:  googleColor ,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.grey : googleColor,
                //   ),
                //   icon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.white : Colors.grey ,
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: googleColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person_pin,
                    color: googleColor ,
                  ),
                  icon: Icon(
                    Icons.person_pin,
                    color:  Colors.grey ,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}

import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/model/menu_item.dart';
import 'package:cozy_meal/product/model/menu_item_poup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PopupMenu1 extends StatelessWidget {
  PopupMenu1({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
          ...MenuItems.menuItemsUser.map(buildItem).toList(),
        ]);
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
      value: item,
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            const Text(" "),
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(color: item.color),
              ),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {
      case MenuItems.addToCart:
        break;

      case MenuItems.itemDelete:
        break;
    }
  }
}


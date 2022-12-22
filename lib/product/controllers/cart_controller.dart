import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartsList = {}.obs;
  final fireRef = FirebaseFirestore.instance.collection('users');
  final controller = Get.find<AuthController>();

  Future<void> addCartToFirstore(Product prodect) async {
    final prodectRef = fireRef
        .doc(controller.displayUserEmail.value)
        .collection("cart")
        .doc(prodect.productNumber);
    final data=prodect.toJson();
    prodectRef.set(data).whenComplete(() {
      Get.snackbar( "Check your cart", "${prodect.productName} is already added");
      if (cartsList.containsKey(prodect)) {
        cartsList[prodect] += 1;
        // Get.snack-bar( "Check your cart", "${prodect.productName} is successfully");
      }else{
        cartsList[prodect] = 1;
      }
    }
    );
  }


// void addProductToCart(Prodect productModels) {
  //   if (cartsList.containsKey(productModels)) {
  //     cartsList[productModels] += 1;
  //   } else {
  //     cartsList[productModels] = 1;
  //   }
  // }

  void removeProductsFarmCart(Product prodect) {
    if (cartsList.containsKey(prodect) &&
        cartsList[prodect] == 1) {
      cartsList.removeWhere((key, value) => key == prodect);
    } else {
      cartsList[prodect] -= 1;
    }
  }

  void removeOneProduct(Product prodect) async {
    if (cartsList.containsKey(prodect)) {
      await fireRef
          .doc(controller.displayUserEmail.value)
          .collection("cart")
          .doc(prodect.productNumber)
          .delete();
      cartsList.removeWhere((key, value) => key == prodect);
      Get.snackbar( prodect.productName, " was removed from your cart" );
    } else {
      Get.snackbar("Error", "Something went wrong ");
    }
  }


  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        cartsList.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? googleColor : googleColor,
    );
  }

  get productSubTotal =>
      cartsList.entries.map((e) => e.key.price * e.value).toList();

  get total => cartsList.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (cartsList.isEmpty) {
      return 0;
    } else {
      return cartsList.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/product/model/product_model.dart';
import 'package:cozy_meal/routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var stoarge = GetStorage();

  var isCatgeoryLoading = false.obs;
  late TextEditingController productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController;

  TextEditingController searchTextController = TextEditingController();
  final fireRef = FirebaseFirestore.instance.collection('users');
  final controller = Get.find<AuthController>();

  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

  final getData = FirebaseFirestore.instance.collection('prodects').snapshots();

  List<Product> prodects = [];
  var searchList = <Product>[].obs;

  //update varible
  var productName = ''.obs;
  var productCategory = ''.obs;
  var productQuantity = ''.obs;
  var productPrice = ''.obs;
  var productDescription = ''.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    productNumberController = TextEditingController();
    productNameControlller = TextEditingController();
    productCategoryController = TextEditingController();
    productQuantityController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
    // TODO: implement initState
  }

  // add to firebase

  Future<void> addProdect(Product prodect) async {
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child("${productNameControlller.text}.jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child("${productNameControlller.text}.jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }
    // we nede Refrence to firebase
    final prodectRef = FirebaseFirestore.instance.collection('prodects').doc();
    prodect.productNumber = prodectRef.id;
    prodect.imageUrl = imgUrl.toString();
    final data = prodect.toJson(); // insert to fiserbase
    prodectRef.set(data).whenComplete(() {
      clearController();
      Get.snackbar("Added", " successfully..");
      Get.offNamed(Routes.stockScreen);
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }

  Future<void> TakePhoto(ImageSource sourse) async {
    final pickedImage =
        await imagePicker.pickImage(source: sourse, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
  }

  // update on firebase

  Future<void> updateProduct(
      productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController,
      imgUrl) async {
    productName.value = productNameControlller.text;
    productCategory.value = productCategoryController.text;
    productQuantity.value = productQuantityController.text;
    productPrice.value = productPriceController.text;
    productDescription.value = productDescriptionController.text;
    imgUrl;

    final ref = FirebaseStorage.instance
        .ref()
        .child("productImage")
        .child(productNameControlller.text + ".jpg");
    if (pickedFile == null) {
    } else {
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }

    final docProduct = FirebaseFirestore.instance
        .collection("prodects")
        .doc(productNumberController);
    docProduct.update({
      "productName": productName.value,
      "category": productCategory.value,
      "quantity": int.parse(productQuantity.value),
      "price": double.parse(productPrice.value),
      "description": productDescription.value,
      "imageUrl": imgUrl.toString(),
    }).whenComplete(() {
      Get.snackbar("Update", " successfully..");
      clearController();
      update();
      Get.offNamed(Routes.storesScreen);
    });
  }

  // delete on firebase
  Future<void> deleteData(
      productNumberController, productNameControlller) async {
    await FirebaseFirestore.instance
        .collection('prodects')
        .doc(productNumberController)
        .delete()
        .whenComplete(() async {
      Get.snackbar("Delete", " successfully..");
      FirebaseStorage.instance
          .ref()
          .child("productImage/")
          .child(productNameControlller + ".jpg")
          .delete()
          .whenComplete(() => null);
    });
  }

  // clear Controller
  void clearController() {
    productNameControlller.clear();
    productCategoryController.clear();
    productQuantityController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    pickedFile = null;
  }

  var cartsList = <Product>[].obs;

  RxBool isFavorite = false.obs;

  Future<void> addFavouriteToFirstore(Product prodect) async {
    final prodectRef = fireRef
        .doc(controller.displayUserEmail.value)
        .collection("favourite")
        .doc(prodect.productNumber);
    final data = prodect.toJson();
    prodectRef.set(data).whenComplete(() {
      if (prodect.productNumber == prodectRef.id) {
        isFavorite = true as RxBool;
        Get.snackbar("Added", " successfully to Favourite list..");
      } else {
        isFavorite = false as RxBool;
        Get.snackbar("Error", "Somthing went wrong ");
      }
    });
    update();
  }
  // final fireRefProdect = FirebaseFirestore.instance.collection('prodects');
  // Future<void> addListToFirstore(String prodect) async {
  //   final prodectRef = fireRefProdect
  //       .doc(prodects.productNumber)
  //       .collection("Prodect")
  //       .doc(prodect.productNumber);
  //   final data=prodect.toJson();
  //   prodectRef.set(data).whenComplete(() {
  //     if(prodect.productNumber==prodectRef.id){
  //
  //       Get.snackbar("Added", " successfully to Favourite list..");
  //     }else{
  //       Get.snackbar("Error", "Somthing went wrong ");
  //     }
  //   }
  //   );
  //   update();
  // }

  Future<void> DeleteFavoret(String id) async {
    await fireRef
        .doc(controller.displayUserEmail.value)
        .collection("favourite")
        .doc(id)
        .delete();
    Get.snackbar("On Favourite", " was removed from your Favourite list");
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = prodects.where((search) {
      var searchTitle = search.productName.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  List<String> imageListSlider = [
    "https://images.unsplash.com/photo-1592663527359-cf6642f54cff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1559496417-e7f25cb247f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1572286258217-40142c1c6a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1520903304654-28bd223f96d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw3NDk0MzIwN3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"
  ];

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}

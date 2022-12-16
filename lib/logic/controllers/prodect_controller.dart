import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_meal/logic/controllers/auth_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
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
  late TextEditingController
      productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController;


  TextEditingController searchTextController =TextEditingController();
  final fireRef = FirebaseFirestore.instance.collection('users');
  final controller = Get.find<AuthController>();




  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

 final getData = FirebaseFirestore.instance.collection('prodects').snapshots();

 List<Prodect> prodects =[];
  var searchList = <Prodect>[].obs;

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


  Future<void> addProdect(Prodect prodect) async {
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
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
      Get.snackbar("", "Added successfully..");
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
    print("..............");
    print(pickedFile);
    print("..............");
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
      print("update done");
      Get.snackbar("Update", " successfully..");
      clearController();
      update();
      Get.offNamed(Routes.mainScreen);
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
      print("delete ${productNumberController}");

      FirebaseStorage.instance
          .ref()
          .child("productImage/")
          .child(productNameControlller + ".jpg")
          .delete()
          .whenComplete(() => print("image delete"));
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

  var favouritesList =<Prodect> [].obs;
  var cartsList =<Prodect> [].obs;



  Future<void> addProdectToFirstore(Prodect prodect) async {
    final prodectRef = fireRef
        .doc(controller.displayUserEmail.value)
        .collection("favourite")
        .doc(prodect.productNumber);
    final data=prodect.toJson();
prodectRef.set(data).whenComplete(() {
      if(prodect.productNumber==prodectRef.id){
        Get.snackbar("Added", " successfully..");

      }else{
        Get.snackbar("Error", "Somthing went wrong ");
      }
    }
    );
    update();
  }


  Future<void> deletefavoret(String id) async {
await fireRef
    .doc(controller.displayUserEmail.value)
    .collection("favourite")
    .doc(id)
    .delete();
Get.snackbar( "On Favourite", " was removed from your cart" );
  }



  bool isFave(String productId) {
    return favouritesList
        .any((element) {
      return element.productNumber== productId;
    });
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



  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

}

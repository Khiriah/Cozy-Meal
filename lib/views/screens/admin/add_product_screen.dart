import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/views/widgets/product/text_field_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductFromScreen extends StatelessWidget {
  AddProductFromScreen({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  // final controller = Get.find<AddProductController>();
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var s = null.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
        Get.offNamed(Routes.stockScreen);
          },
          child: Text("Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        title: Text(
          "Add new product",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,
        actions: [
          GetBuilder<ProductController>(builder: (_) {
            return TextButton(
              onPressed: () async {
                if (myKey.currentState!.validate()) {
                  Prodect product = Prodect(
                      productName: controller.productNameControlller.text,
                      category: controller.productCategoryController.text,
                      quantity:
                      int.parse(controller.productQuantityController.text),
                      price:
                      double.parse(controller.productPriceController.text),
                      description: controller.productDescriptionController.text,
                      imageUrl: controller.imgUrl);
                  if (controller.pickedFile == null) {
                    print("no image slected");
                    Get.snackbar(
                      "Eroor",
                      "You must add image please",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                    );
                  }
                  await controller.addProdect(product);
                } else {
                  return;
                }
              },
              child: Text(
                "Add",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            );
          })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Product Name', color: Colors.black, fontWeight: FontWeight.bold,fontsize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productNameControlller,
                  obscureText: false,
                  hintText: 'Product Name',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Name Please';
                    }
                  },
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Category', color: Colors.black, fontWeight: FontWeight.bold,fontsize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productCategoryController,
                  obscureText: false,
                  hintText: 'Product Category',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Category Please';
                    }
                  },
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),

                TextUtils(
                  text: 'Quantity', color: Colors.black, fontWeight: FontWeight.bold,fontsize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productQuantityController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  hintText: 'Quantity',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Quantity Please';
                    }
                  },
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),

                TextUtils(
                  text: 'Price', color: Colors.black, fontWeight: FontWeight.bold,fontsize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productPriceController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Price Please';
                    }
                  },
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Description', color: Colors.black, fontWeight: FontWeight.bold,fontsize: 20,
                ),
                SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 76,
                  width: 361,
                  controller: controller.productDescriptionController,
                  obscureText: false,
                  hintText: 'placeholder',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Description Please';
                    }
                  },
                  maxLength: 100,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.TakePhoto(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(217, 217, 217, 1),
                      padding: EdgeInsets.all(16),
                      minimumSize: Size(1, 6)),
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Add Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

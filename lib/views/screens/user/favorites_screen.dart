import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_meal/logic/controllers/auth_controller.dart';
import 'package:cozy_meal/logic/controllers/cart_controller.dart';
import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/model/product_model.dart';
import 'package:cozy_meal/views/widgets/avorites_widget.dart';
import 'package:cozy_meal/views/widgets/product/empty_favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put(ProductController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              stream:
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(authController.displayUserEmail.value)
                  .collection("favourite").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('leeength ${snapshot.data!.docs}');
             return FavoriteWidget(prodectModels: snapshot.data!.docs,);
              }   else if(!snapshot.hasData){
                return EmptyFavorites();
              }
              return FavoriteWidget(prodectModels: snapshot.data!.docs,);
            },
          ),
        ],
      ),
       );
  }
}

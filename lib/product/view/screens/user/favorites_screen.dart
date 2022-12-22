import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/product/view/widgets/favorite/empty_favorites.dart';
import 'package:cozy_meal/product/view/widgets/favorite/favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put(ProductController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(authController.displayUserEmail.value)
                .collection("favourite")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FavoriteWidget(
                  productModels: snapshot.data!.docs,
                );
              } else if (!snapshot.hasData) {
                return const EmptyFavorites();
              }
              return FavoriteWidget(
                productModels: snapshot.data!.docs,
              );
            },
          ),
        ],
      ),
    );
  }
}

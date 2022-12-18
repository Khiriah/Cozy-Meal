import 'package:cozy_meal/logic/controllers/prodect_controller.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProducts extends StatelessWidget {
  SearchProducts({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: controller.searchTextController,
        cursorColor: Get.isDarkMode ? Colors.grey : mainColor,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor:  Get.isDarkMode? mainColor:Colors.grey,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: googleColor,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon: const Icon(
              Icons.close,
              color: googleColor,
            ),
          )
              : null,
          hintText: "Search with name & price",
          hintStyle: const TextStyle(
            color: googleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

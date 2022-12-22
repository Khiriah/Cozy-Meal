import 'package:cozy_meal/product/controllers/cart_controller.dart';
import 'package:cozy_meal/product/controllers/main_controller.dart';
import 'package:cozy_meal/product/controllers/product_controller.dart';
import 'package:cozy_meal/auth/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }
}

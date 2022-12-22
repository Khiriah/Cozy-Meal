import 'package:cozy_meal/auth/view/screens/setting/profile.dart';
import 'package:cozy_meal/product/view/screens/user/favorites_screen.dart';
import 'package:cozy_meal/product/view/screens/user/home_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ].obs;

  var title = [
    "Cozy Meal",
    'Favourites',
    "Profile",
  ].obs;
}
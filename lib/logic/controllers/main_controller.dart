import 'package:cozy_meal/views/screens/setting/profile.dart';
import 'package:cozy_meal/views/screens/user/favorites_screen.dart';
import 'package:cozy_meal/views/screens/user/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

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
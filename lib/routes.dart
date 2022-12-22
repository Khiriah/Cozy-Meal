import 'package:cozy_meal/auth/bindings/auth_binding.dart';
import 'package:cozy_meal/auth/bindings/main_binding.dart';
import 'package:cozy_meal/auth/view/screens/first_screen.dart';
import 'package:cozy_meal/auth/view/screens/forget_password_screen.dart';
import 'package:cozy_meal/auth/view/screens/login_screen.dart';
import 'package:cozy_meal/auth/view/screens/setting/edit_profile_screen.dart';
import 'package:cozy_meal/auth/view/screens/setting/profile.dart';
import 'package:cozy_meal/auth/view/screens/setting/settings_screen.dart';
import 'package:cozy_meal/auth/view/screens/signup_screen.dart';
import 'package:cozy_meal/product/view/screens/admin/add_product_screen.dart';
import 'package:cozy_meal/product/view/screens/admin/stock_screen.dart';
import 'package:cozy_meal/product/view/screens/cart/cart_screen.dart';
import 'package:cozy_meal/product/view/widgets/category/stores_screen.dart';
import 'package:get/route_manager.dart';
import 'product/view/screens/user/main_screen.dart';

class AppRoutes {
  static const login = Routes.loginScreen;
  static const first = Routes.firstScreen;
  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        MainBinding()
      ],
    ),
    GetPage(
      name: Routes.addProductFromScreen,
      page: () => AddProductFromScreen(),
      bindings: [
        AuthBinding(),
        MainBinding()
      ],
    ), GetPage(
      name:Routes.firstScreen,
      page: () => const FirstScreen(),
      bindings: [
        AuthBinding(),
        MainBinding()
      ],
    ),
    GetPage(
      name: Routes.stockScreen,
      page: () => StockScreen(),
      bindings: [
        AuthBinding(),
        MainBinding()
      ],

    ),
    GetPage(
      name: Routes.storesScreen,
      page: () => StoresScreen(),
      bindings: [
        AuthBinding(),
        MainBinding()
      ],

    ),

  ];
}


class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgetPasswordScreen = '/forget_password_screen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const settingsScreen = '/settingsScreen';
  static const mainScreen = '/main_screen';
  static const cartScreen = '/cart_screen';
  static const addProductFromScreen = '/add_product_from_screen';
  static const firstScreen = '/first_screen';
  static const stockScreen = '/stock_screen';
  static const storesScreen = '/stores_screen';

}

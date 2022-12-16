import 'package:cozy_meal/logic/bindings/main_binding.dart';
import 'package:cozy_meal/views/screens/admin/add_product_screen.dart';
import 'package:cozy_meal/views/screens/admin/stock_screen.dart';
import 'package:cozy_meal/views/screens/datiles/details_screen.dart';
import 'package:cozy_meal/views/screens/first_screen.dart';
import 'package:cozy_meal/views/screens/forgot_password_screen.dart';
import 'package:cozy_meal/views/screens/login_screen.dart';
import 'package:cozy_meal/views/screens/setting/edit_profile_screen.dart';
import 'package:cozy_meal/views/screens/setting/profile.dart';
import 'package:cozy_meal/views/screens/setting/settings_screen.dart';
import 'package:cozy_meal/views/screens/signup_screen.dart';
import 'package:cozy_meal/views/screens/cart/cart_screen.dart';
import 'package:cozy_meal/views/screens/user/main_screen.dart';
import 'package:cozy_meal/views/widgets/product/catagory/stores_screen.dart';
import 'package:get/route_manager.dart';
import 'logic/bindings/auth_binding.dart';

class AppRoutes {
  static const login = Routes.loginScreen;
  static const first = Routes.firstScreen;
  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
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
      page: () => FirstScreen(),
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
  static const forgotpasswordScreen = '/forgotpasswordScreen';
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

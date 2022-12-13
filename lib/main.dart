import 'package:cozy_meal/logic/bindings/auth_binding.dart';
import 'package:cozy_meal/logic/controllers/theme_controller.dart';
import 'package:cozy_meal/routes.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          locale: Locale(GetStorage().read<String>('lang').toString()),
          debugShowCheckedModeBanner: false,
          // translations: LocaliztionApp(),
          // fallbackLocale: Locale(ene),
          theme: ThemesApp.light,
          darkTheme: ThemesApp.dark,
           themeMode: ThemeController().themeDataGet,
          initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
              ? AppRoutes.first
              : AppRoutes.login,
          //  initialRoute: Routes.loginScreen,
          getPages: AppRoutes.routes,
          // initialBinding: MainBinding(),
          // initialBinding: AuthBinding(),
        );
      },
    );
  }
}
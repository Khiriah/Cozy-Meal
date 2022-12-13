import 'package:cozy_meal/logic/controllers/auth_controller.dart';
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:cozy_meal/views/widgets/settings/dark_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/settings/change_password.dart';
import '../../widgets/settings/logout.dart';
import '../../widgets/settings/notification.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 3.5.h,
            ),
            TextUtils(
              fontsize: 14.sp,
              fontWeight: FontWeight.bold,
              text: "Account",
              color:  Get.isDarkMode ? googleColor: mainColor,
            ),
            SizedBox(
              height: 3.5.h,
            ),
            ChangePassword(),
            Divider(
              color:Get.isDarkMode ? Colors.black : Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            NotificationWidget(),
            Divider(
              color:  Get.isDarkMode ? Colors.black : Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            DarkModeWidget(),
            Divider(
              color:  Get.isDarkMode ? Colors.black : Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            LogOut(),
          ],
        ),
      ),
    );
  }
}

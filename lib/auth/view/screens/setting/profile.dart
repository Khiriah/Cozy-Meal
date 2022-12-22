import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/auth/controllers/setting_controller.dart';
import 'package:cozy_meal/auth/view/widgets/settings/settings.dart';
import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/settings/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
   return Container(
      color:  context.theme.backgroundColor,
          child: GetBuilder<AuthController>(builder: (_) {
            return Obx(() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: authController.displayUserPhoto.value == ""
                                  ? const AssetImage("assets/images/avtar.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      authController.displayUserPhoto.value,
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayUserName.value,
                          color:  googleColor,
                          fontsize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayDescription.value,
                          color:  Get.isDarkMode ? Colors.white: Colors.black,
                          fontsize: 9.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayUserEmail.value,
                          color: Get.isDarkMode ? Colors.white: Colors.black,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextUtils(
                          fontsize: 14.sp,
                          fontWeight: FontWeight.bold,
                          text: "Account",
                          color: Get.isDarkMode ? googleColor: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      EditProfile(),
                      Divider(
                        color: Get.isDarkMode ? Colors.white: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      SettingsWidget(),
                    ],
                  ),
                ));
          })
    );
  }
}

import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/auth/view/widgets/icon_widget.dart';
import 'package:cozy_meal/auth/view/widgets/login_email_form.dart';
import 'package:cozy_meal/auth/view/widgets/login_phone_number.dart';
import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 1, bottom: 363, right: 45, left: 55),
          child: Column(
         
              children: [
                SizedBox(
                  height:2.04.h,
                ),
            Container(
                height: 190,
                width: 190,
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/cozymeal.png")),
            SizedBox(
              height: 5.8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<AuthController>(builder: (_) {
                  return IconWidget(
                    conternierColor: containerColor,
                    onPressed: () {
                      controller.loginUsinggoogle();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(child: CircularProgressIndicator());
                        },
                      );
                    },
                    image: 'assets/images/image 14google.png',
                    textUtils: "with Google",
                  );
                }),
                SizedBox(
                  width: 5.08.w,
                ),
                IconWidget(
                  conternierColor: Colors.black,
                  onPressed: () {},
                  image: 'assets/images/image 16Apple.png',
                  textUtils: "with Apple",
                ),
              ],
            ),
            SizedBox(
              height: 7.04.h,
            ),
            TextUtils(
                text: "or",
                color: labalColor,
                fontWeight: FontWeight.normal,
                fontsize: 11.sp,
                underLine: TextDecoration.none),
            SizedBox(
              height: 2.34.h,
            ),
            SizedBox(
              height: 4.69.h,
              child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: labalColor,
                  tabs: [
                    Tab(
                      child: Text("Email", style: TextStyle(fontSize: 12.sp)),
                    ),
                    Tab(
                        child: Text("Phone number",
                            style: TextStyle(fontSize: 12.sp)))
                  ]),
            ),
            SizedBox(
              height: 46.60.h,
              child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    LoginEmailForm(),
                    LoginPhoneNumberForm()]),
            ),
          ]),
        ),
      ),
    );
  }
}

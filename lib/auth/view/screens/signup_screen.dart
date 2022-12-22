import 'package:cozy_meal/auth/controllers/auth_controller.dart';
import 'package:cozy_meal/auth/view/widgets/icon_widget.dart';
import 'package:cozy_meal/auth/view/widgets/signUp_email_form.dart';
import 'package:cozy_meal/auth/view/widgets/signUp_phone_number_form.dart';
import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 90, bottom: 363, right: 40, left: 50),
          child: Column(
            children: [
              TextUtils(
                  text: 'Sign Up by',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 3.7.h,
              ),
              Row(
                children: [
                  GetBuilder<AuthController>(builder: (_) {
                    return IconWidget(
                      conternierColor: googleColor,
                      onPressed: () async {
                        await controller.loginUsinggoogle();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(child: CircularProgressIndicator());
                          },
                        );
                      },
                      textUtils: 'with Google',
                      image: 'assets/images/image 14google.png',
                    );
                  }),
                  SizedBox(
                    width: 4.w,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return IconWidget(
                        conternierColor: Colors.black,
                        onPressed: () {},
                        textUtils: 'with Apple',
                        image: 'assets/images/image 14google.png',
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 6.3.h,
              ),
              TextUtils(
                  text: 'or',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 2.3.h,
              ),
              SizedBox(
                height: 40,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: mainColor,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Phone number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 650,
                child:
                    TabBarView(controller: controller.tabController, children: [
                       SignUpEmailForm(),
                       SignUpPhoneNumberForm(),
                ]),
              )
            ],
          ), // end page
        ),
      ),
    );
  }
}

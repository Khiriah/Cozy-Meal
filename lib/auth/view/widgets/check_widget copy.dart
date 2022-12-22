import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../auth/controllers/auth_controller.dart';

class CheckWidget2 extends StatelessWidget {
  CheckWidget2({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.CheckBox();
            },
            child: Container(
              height: 2.11.h,
              width: 4.58.w,
              decoration: BoxDecoration(
                  color: labalColor, borderRadius: BorderRadius.circular(4)),
              child: controller.isCheckBox
                  ? const Icon(
                      Icons.done,
                      size: 15,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.crop_square_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
            ),
          ),
          SizedBox(
            width: 2.54.w,
          ),
          TextUtils(
            text: "Remember me ",
            color: labalColor,
            fontWeight: FontWeight.normal,
            fontsize: 9.sp,
          ),
          SizedBox(
            width: 3.05.w,
          ),
        ],
      );
    });
  }
}

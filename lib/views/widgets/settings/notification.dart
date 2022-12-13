
import 'package:cozy_meal/utils/text_utils.dart';
import 'package:cozy_meal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';



class NotificationWidget extends StatelessWidget {
  NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          fontsize: 12.sp,
          fontWeight: FontWeight.w300,
          text: "Notification",
          color: Get.isDarkMode ? Colors.black: Colors.white,
        ),
        Switch(
          activeTrackColor: googleColor,
          activeColor: mainColor,
          value: false,
          onChanged: (_) {


          },
        ),
      ],
    );
  }
}
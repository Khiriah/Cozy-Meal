import 'package:cozy_meal/theme/utils/text_utils.dart';
import 'package:cozy_meal/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String typeText;
  final Function() onPressed;
  const ContainerUnder(
      {required this.text,
      required this.typeText,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtils(
            text: text,
            color: labalColor,
            fontWeight: FontWeight.normal,
            fontsize: 10.sp,
            underLine: TextDecoration.none),
        TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(12.72.w, 3.52.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            child: TextUtils(
                text: typeText,
                color: buttonColor,
                fontWeight: FontWeight.w400,
                fontsize: 10.sp,
                underLine: TextDecoration.underline))
      ],
    );
  }
}

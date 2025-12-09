import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/utils/extension/app_context.dart';

class TypeSelectionWidget extends StatelessWidget {
  final Color color, defaultColor;

  final String status;
  final bool isSelected;
  final double? width;
  final double borderWidth;
  final double fontSize;
  final void Function()? onTap;
  const TypeSelectionWidget({
    super.key,
    this.color = AppColor.primary,
    this.defaultColor = AppColor.transparent,

    required this.status,
    required this.isSelected,
    this.width,
    this.borderWidth = 1,
    this.fontSize = 15,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 26.h),
        decoration: BoxDecoration(
          color: isSelected ? color : defaultColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: color, width: borderWidth.w),
        ),
        child: Center(
          child: Content(
            data: status,
            size: fontSize.h,
            textStyle: context.subHeadingText,
            color: isSelected ? AppColor.white : color,
          ),
        ),
      ),
    );
  }
}

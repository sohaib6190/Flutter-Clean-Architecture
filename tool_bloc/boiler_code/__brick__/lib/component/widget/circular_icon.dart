import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skyl/resource/app_color.dart';

class CircularIcon extends StatelessWidget {
  final double size;
  final String path;
  final Color fillColor;
  final Color? iconColor;
  final double padding;
  const CircularIcon({
    super.key,
    required this.path,
    this.size = 42,
    this.fillColor = AppColor.white,
    this.iconColor,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.h,
      width: size.h,
      padding: EdgeInsets.all(padding.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.blueLightAltAlt.withValues(alpha: 0.35),
          width: 1.w,
        ),
        color: fillColor,
      ),
      child: (path.split('.').last == 'svg')
          ? SvgPicture.asset(
              path,
              color: iconColor,
              fit: BoxFit.cover,
              theme: iconColor != null
                  ? SvgTheme(currentColor: iconColor!)
                  : null,
            )
          : Image.asset(path, fit: BoxFit.cover, color: iconColor),
    ).paddingOnly(right: 10.w);
  }
}

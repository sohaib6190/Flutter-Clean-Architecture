import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconPath;
  final Color color, iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  const CustomIconWidget({
    super.key,
    this.onTap,
    required this.iconPath,
    this.iconColor = Colors.white,
    required this.color,
    this.padding,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: (iconSize ?? 25).w,
              height: (iconSize ?? 25).w,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

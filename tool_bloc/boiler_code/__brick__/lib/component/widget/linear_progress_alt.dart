import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/resource/app_color.dart';

class LinearProgressAlt extends StatelessWidget {
  final double height;
  const LinearProgressAlt({super.key, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(20),
      value: 0.6, // Example progress value
      minHeight: height.h,
      backgroundColor: AppColor.highlightlow,
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
    );
  }
}

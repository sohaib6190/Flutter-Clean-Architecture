import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/resource/app_color.dart';

class LinearProgress extends StatelessWidget {
  Color valueColor;
  Color trackColor;

  LinearProgress({
    super.key,
    this.valueColor = AppColor.primarylight,
    this.trackColor = AppColor.highlightlow,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(20),
      value: 0.6, // Example progress value
      minHeight: 18.h,
      backgroundColor: trackColor,
      valueColor: AlwaysStoppedAnimation<Color>(valueColor),
    );
  }
}

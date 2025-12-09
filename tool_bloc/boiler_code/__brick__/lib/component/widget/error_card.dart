import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/utils/extension/app_context.dart';

class ErrorCard extends StatelessWidget {
  final String error;
  const ErrorCard({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColor.redLight.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        spacing: 10.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info, color: AppColor.red, size: 20.h),
          Expanded(
            child: Content(
              data: error,
              size: 13.sp,
              textStyle: context.bodyText,
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}

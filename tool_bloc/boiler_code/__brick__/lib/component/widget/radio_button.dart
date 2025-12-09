import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/resource/app_color.dart';

class RadioButton extends StatelessWidget {
  final double size;
  final bool isSelected;
  final void Function()? onTap;
  const RadioButton({
    super.key,
    this.size = 24,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: isSelected ? AppColor.primary : AppColor.highlightlow,
          ),

          color: AppColor.white,
        ),
        padding: EdgeInsets.all(2),
        child: Container(
          height: size.h,
          width: size.h,

          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(width: 3,color: !isSelected ? AppColor.green : AppColor.red, ),
            color: isSelected ? AppColor.primary : AppColor.highlightlow,
          ),
        ),
      ),
    );
  }
}

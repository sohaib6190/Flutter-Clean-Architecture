import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../constants/app_dimensions.dart';
import 'custom_text.dart';

class DialogItemSubTitleWidget extends StatelessWidget {
  final String? text;
  const DialogItemSubTitleWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text ?? "",
      fontSize: AppDimensions.dialogContentFontSize.sp,
    );
  }
}

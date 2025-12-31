import 'package:flutter/material.dart';


import '../constants/app_dimensions.dart';
import 'custom_text.dart';

class DialogItemTitleWidget extends StatelessWidget {
  final String? text;
  const DialogItemTitleWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text ?? "",
      fontSize: AppDimensions.dialogTitleFontSize,
      maxLines: 3,
    );
  }
}

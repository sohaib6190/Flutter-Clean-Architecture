import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/component/widget/radio_button.dart';
import 'package:skyl/utils/extension/app_context.dart';

class RadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  const RadioTile({super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Content(data: title, size: 14.sp, textStyle: context.bodyText),
        RadioButton(size: 16, isSelected: isSelected),
      ],
    );
  }
}

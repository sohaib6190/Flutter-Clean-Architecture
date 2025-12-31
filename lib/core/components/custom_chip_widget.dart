import 'package:flutter/material.dart';

import '../constants/app_texts.dart';
import 'custom_text.dart';


class CustomChipWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? heading;
  final bool? isSuccess;
  final Color? color;

  const CustomChipWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isSuccess,
    this.heading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: heading ?? AppTexts.binCodeFilter),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: chipColor.withAlpha(30),
              border: Border.all(color: chipColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text, style: TextStyle(color: chipColor)),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.close, size: 18, color: chipColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

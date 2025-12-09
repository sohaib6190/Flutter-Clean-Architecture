import 'package:flutter/material.dart';

import '../constants/app_texts.dart';
import 'custom_text.dart';


class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? icon;
  final String? text;
  final Color? iconColor;
  const CustomIconButton({
    super.key,
    required this.onTap,
    this.icon,
    this.iconColor,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon ?? Icon(Icons.logout, color: iconColor ?? Colors.red),
      title: CustomText(text: text ?? AppTexts.logout, color: Colors.black),
      onTap: onTap,
    );
  }
}

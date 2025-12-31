import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollToBottomWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ScrollToBottomWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      right: 10.w,
      child: FloatingActionButton(
        onPressed: onTap,
        child: const Icon(
          Icons.keyboard_double_arrow_down,
          color: Colors.white,
        ),
      ),
    );
  }
}

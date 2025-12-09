import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skyl/resource/app_color.dart';

class DiscreteLoading extends StatelessWidget {
  final Color mainColor, secondColor;
  final Color? thirdColor;
  final double size;
  const DiscreteLoading({
    super.key,
    this.mainColor = AppColor.primarylight,
    this.secondColor = AppColor.primary,
    this.thirdColor,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: mainColor,
      secondRingColor: secondColor,
      thirdRingColor: thirdColor ?? AppColor.black.withValues(alpha: 0.5),
      size: size.h,
    );
  }
}

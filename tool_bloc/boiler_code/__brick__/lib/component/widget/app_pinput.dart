import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/utils/extension/app_context.dart';

class AppPinput extends StatefulWidget {
  final TextEditingController controller;
  const AppPinput({super.key, required this.controller});

  @override
  _AppPinputState createState() => _AppPinputState();

  @override
  String toStringShort() => 'With Bottom Cursor';
}

class _AppPinputState extends State<AppPinput> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = AppColor.primary;

    final underlinePinTheme = PinTheme(
      width: 40.h,
      height: 40.h,
      textStyle: context.bodyText.copyWith(
        fontSize: 20.sp,
        color: AppColor.black,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
    );

    return Pinput(
      length: 6,
      pinAnimationType: PinAnimationType.slide,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: widget.controller,
      focusNode: focusNode,
      defaultPinTheme: underlinePinTheme,
      focusedPinTheme: underlinePinTheme,
      submittedPinTheme: underlinePinTheme,
      showCursor: true,
    );
  }
}

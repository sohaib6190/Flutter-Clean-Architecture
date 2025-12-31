import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_palette.dart';
import '../constants/app_texts.dart';
import '../constants/asset_paths.dart';
import '../extensions/context_extensions.dart';
import 'custom_button.dart';
import 'custom_text.dart';


class AnimatedStatusDialog extends StatefulWidget {
  final Widget? icon;
  final bool isSuccess;
  final String? title;
  final String? message;
  final String? primaryButtonText, primaryButtonIcon, secondaryButtonIcon;
  final VoidCallback? onPrimaryTap;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryTap;
  final Widget? content;

  const AnimatedStatusDialog({
    super.key,
    this.icon,
    required this.isSuccess,
    this.title,
    this.message,
    this.primaryButtonText,
    this.onPrimaryTap,
    this.secondaryButtonText,
    this.onSecondaryTap,
    this.primaryButtonIcon,
    this.secondaryButtonIcon,
    this.content,
  });

  /// 💥 Show function for convenience
  static Future<void> show({
    required BuildContext context,
    Widget? icon,
    required bool isSuccess,
    String? title,
    String? message,
    String? primaryButtonText,
    VoidCallback? onPrimaryTap,
    String? secondaryButtonText,
    String? primaryButtonIcon,
    String? secondaryButtonIcon,
    VoidCallback? onSecondaryTap,
    Widget? content,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AnimatedStatusDialog(
            icon: icon,
            isSuccess: isSuccess,
            title: title,
            message: message,
            primaryButtonText: primaryButtonText,
            onPrimaryTap: onPrimaryTap,
            secondaryButtonText: secondaryButtonText,
            onSecondaryTap: onSecondaryTap,
            primaryButtonIcon: primaryButtonIcon,
            secondaryButtonIcon: secondaryButtonIcon,
            content: content,
          ),
    );
  }

  @override
  State<AnimatedStatusDialog> createState() => _AnimatedStatusDialogState();
}

class _AnimatedStatusDialogState extends State<AnimatedStatusDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon ??
                  Image.asset(
                    widget.isSuccess
                        ? AppAssets.successIcon
                        : AppAssets.warningIcon,
                    width: widget.isSuccess ? 64.w : 64.w,
                    height: widget.isSuccess ? 64.w : 64.w,
                    color: widget.isSuccess ? null : AppPalette.yellowColor,
                  ),
              SizedBox(height: 20.h),
              _title(),
              SizedBox(height: 8.h),
              _description(),
              if (widget.content != null) ...[
                SizedBox(height: 16.h),
                widget.content!,
              ],
              SizedBox(height: 24.h),
              _actions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment:
          widget.secondaryButtonText != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
      children: [
        if (widget.secondaryButtonText != null)
          Expanded(
            flex: 4,
            child: CustomButton(
              height: 45.h,
              onPressed: () {
                Navigator.pop(context);
                widget.onSecondaryTap?.call();
              },
              color: Colors.white,
              text: widget.secondaryButtonText ?? AppTexts.cancel,
              textColor: context.primaryColor,
              borderColor: context.primaryColor,
              iconWidget:
                  widget.secondaryButtonIcon == null
                      ? null
                      : Image.asset(
                        widget.secondaryButtonIcon!,
                        width: 17,
                        height: 17,
                        color: context.primaryColor,
                      ),
              isBorder: true,
            ),
          ),
        5.horizontalSpace,
        Expanded(
          flex: 6,
          child: Padding(
            padding:
                widget.secondaryButtonText == null
                    ? EdgeInsets.symmetric(horizontal: 20.w)
                    : EdgeInsets.zero,
            child: CustomButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onPrimaryTap?.call();
              },
              height: 45.h,
              color: context.primaryColor,
              iconWidget:
                  widget.primaryButtonIcon == null
                      ? null
                      : Image.asset(
                        widget.primaryButtonIcon!,
                        width: 17,
                        height: 17,
                        color: Colors.white,
                      ),
              text: widget.primaryButtonText ?? AppTexts.continuee,
            ),
          ),
        ),
      ],
    );
  }

  CustomText _description() {
    return CustomText(
      text:
          widget.message ??
          (widget.isSuccess
              ? AppTexts.actionCompletedSuccessfully
              : AppTexts.tryAgainLater),
      fontSize: 15.sp,
      color: AppPalette.greyColor,
      textAlign: TextAlign.center,
      maxLines: 10,
    );
  }

  CustomText _title() {
    return CustomText(
      text:
          widget.title ??
          (widget.isSuccess ? AppTexts.success : AppTexts.somethingWentWrong),
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
      color: AppPalette.darkGreyColor,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}

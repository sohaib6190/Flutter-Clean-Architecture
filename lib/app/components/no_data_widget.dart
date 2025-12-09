import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../constants/app_palette.dart';
import '../constants/app_texts.dart';
import '../constants/asset_paths.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class NoDataWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData icon;
  final double? imageSize;
  final double? fontSize;
  final bool isError;
  final VoidCallback? onRetry;
  final double? verticalPadding;
  final Color? textColor;
  final String? imagePath;
  final bool showBorder;
  final bool isVerticalLayout;

  const NoDataWidget({
    super.key,
    this.fontSize,
    this.subtitle,
    this.title = AppTexts.noDataAvailable,
    this.icon = Icons.inbox,
    this.imageSize,
    this.textColor,
    this.imagePath,
    this.showBorder = true,
    this.isVerticalLayout = false,
    this.verticalPadding,
    required this.isError,
    this.onRetry,
  });

  /// Named constructor: Large version without border, image and text in column
  const NoDataWidget.noBorderLarge({
    super.key,
    this.title,
    this.isError = false,
    this.onRetry,
    this.textColor,
    this.imagePath,
    this.verticalPadding,
    this.imageSize = 70,
    this.subtitle,
  }) : icon = Icons.inbox,

       fontSize = 12,
       showBorder = false,
       isVerticalLayout = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: isVerticalLayout ? 30.h : 20.h),
      decoration:
          showBorder
              ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppPalette.lightGreyColor, width: 1),
              )
              : null,
      child: Center(
        child: isVerticalLayout ? _verticalLayout() : _horizontalLayout(),
      ),
    );
  }

  Widget _horizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        20.horizontalSpace,
        Container(
          padding: EdgeInsets.all(11.sp),
          decoration: BoxDecoration(
            color: AppPalette.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppPalette.primaryColor, width: 1),
          ),
          child: Image.asset(
            AppAssets.emptyIcon,
            width: imageSize ?? 34.w,
            height: imageSize ?? 34.w,
            color: AppPalette.primaryColor,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title ?? AppTexts.emptyItemList,
                fontSize: 16.sp,
                color: textColor ?? AppPalette.darkGreyColor,
                fontWeight: FontWeight.w600,
              ),
              4.verticalSpace,
              CustomText(
                text: subtitle ?? AppTexts.itemNotAddedYet,
                fontSize: 13.sp,
                maxLines: 2,
                color: textColor ?? AppPalette.greyColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        20.horizontalSpace,
      ],
    );
  }

  Container _verticalLayout() {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? (isError == true ? 30.h : 60.w),
        //  horizontal: 120.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isError == true && onRetry != null)
            Icon(Icons.error, size: 100, color: AppPalette.yellowColor)
          else
            Image.asset(
              imagePath ?? AppAssets.emptyIllustration,
              width: 260.w,
              height: 260.h,
            ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 260.w,
            child: CustomText(
              text: title ?? AppTexts.emptyItemList,
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: textColor ?? AppPalette.darkGreyColor,
              fontWeight: FontWeight.w600,
              maxLines: 2,
            ),
          ),
          if (subtitle?.isNotEmpty == true) ...[
            SizedBox(height: 8.h),
            SizedBox(
              width: 260.w,
              child: CustomText(
                text: subtitle ?? "",
                fontSize: 12.sp,
                color: textColor ?? AppPalette.greyColor,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                maxLines: 10,
              ),
            ),
          ],

          if (isError == true && onRetry != null) ...[
            SizedBox(height: 16.h),
            SizedBox(
              width: 180.w,
              child: CustomButton(text: AppTexts.tryAgain, onPressed: onRetry!),
            ),
          ],
        ],
      ),
    );
  }
}

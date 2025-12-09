import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skyl/component/bottom_sheet/app_bottom_sheet.dart';
import 'package:skyl/component/button/app_button.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/features/dashboard/get_started/get_started_initial_params.dart';
import 'package:skyl/features/dashboard/get_started/view/get_started_view.dart';
import 'package:skyl/main.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/utils/app_navigation.dart';
import 'package:skyl/utils/extension/app_context.dart';
import 'package:skyl/utils/utils.dart';

class CashBackVoucherAlert extends StatelessWidget {
  const CashBackVoucherAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => context.popPage(),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary,
              ),
              child: Icon(Icons.close, color: AppColor.white, size: 16),
            ),
          ),
        ),
        Column(
          spacing: 15.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Content(
              data: "Cash Back Voucher",
              textStyle: context.subHeadingText,
              color: AppColor.black,
              size: 14,
            ),

            Content(
              data: "Get 50% off",
              textStyle: context.headingText,
              color: AppColor.primary,
              size: 35,
            ),
            SizedBox(
              width: 0.5.sw,
              child: Content(
                data:
                    "Grow your apparel stock while saving half on your investment.",
                textStyle: context.subHeadingText,
                color: AppColor.black,
                alignment: TextAlign.center,
                size: 12,
              ),
            ),
            3.verticalSpace,
            AppButton(
              height: 34.h,
              width: 0.32.sw,
              title: "Claim Voucher",
              fontSize: 10,
              onTap: () {
                Utils.toastStackMessage(
                  "You have claimed 50% Cash Back",
                  context,
                );
                Timer(
                  Duration(seconds: 2),
                  () => appBottomSheet(
                    context,
                    GetStartedView(
                      bloc: getIt(param1: GetStartedInitialParams()),
                    ),
                    title: 'GET STARTED WITH SKYL',
                    subTitle: "Create your first order",
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () => context.popPage(),
              child: Content(
                data: "No, I don't want it",
                textStyle: context.bodyText.copyWith(
                  decoration: TextDecoration.underline,
                ),
                color: AppColor.highlightdark,
                size: 12,
              ),
            ),
            3.verticalSpace,
          ],
        ),
      ],
    );
  }
}

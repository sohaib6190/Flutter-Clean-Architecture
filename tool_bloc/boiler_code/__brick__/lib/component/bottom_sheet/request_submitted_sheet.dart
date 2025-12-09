import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skyl/component/button/app_button.dart';
import 'package:skyl/resource/app_asset.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/route/app_route.dart';

class RequestSubmittedSheet extends StatelessWidget {
  final bool isOrder;
  const RequestSubmittedSheet({super.key, this.isOrder = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Image.asset(isOrder ? AppAsset.orderSuccessful : AppAsset.success),
        AppButton(
          title: "Go to Homepage",
          fontColor: AppColor.highlightdark,
          buttonColor: AppColor.highlightlow,
          onTap: () => Navigator.popUntil(
            context,
            ModalRoute.withName(AppRoutes.dashboard),
          ),

          // context.popUntilPage(Dashboa),
        ),
      ],
    );
  }
}

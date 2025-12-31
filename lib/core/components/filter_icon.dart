import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_palette.dart';
import '../constants/asset_paths.dart';


class FilterIcon extends StatelessWidget {
  final VoidCallback? onTap;
  const FilterIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.5.h,
        width: 48.5.h,
        decoration: BoxDecoration(
          color: AppPalette.lightGreyColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Transform.scale(
          scale: 0.48,
          child: Image.asset(
            AppAssets.filterIconTwo,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
        ),
        //   );
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/asset_paths.dart';


class TimePressLogo extends StatelessWidget {
  const TimePressLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.mdzLogo, height: 70.h, width: 240.w);
    //return Container(height: 70.h, width: 240.w);
  }
}

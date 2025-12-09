import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_palette.dart';



class AppTabBar extends StatelessWidget {
  final TabController controller;
  final List<Tab> tabs;

  const AppTabBar({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TabBar(
        controller: controller,
        labelColor: AppPalette.primaryColor,
        unselectedLabelColor: AppPalette.darkGreyColor,
        indicatorColor: AppPalette.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        indicatorWeight: 3.0,
        tabs: tabs,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/resource/app_asset.dart';

import 'package:skyl/utils/extension/app_context.dart';

import '../../../../component/app_bar/app_appbar.dart';


class {{name.pascalCase()}}View extends StatefulWidget {
  final {{name.pascalCase()}}Bloc bloc;
  {{name.pascalCase()}}View({
    super.key,
    required this.bloc,
  });

  @override
  State<{{name.pascalCase()}}View> createState() => _{{name.pascalCase()}}ViewState();
}

class _{{name.pascalCase()}}ViewState extends State<{{name.pascalCase()}}View> {
  @override
  void didChangeDependencies() {
    // widget.viewModel.context = context;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,

      body: Container(
        // padding: EdgeInsets.only(top: context.pagePadding.top),
        decoration: BoxDecoration(gradient: AppColor.primaryGradient),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.pagePadding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                AppAppbar(width: 75.w, title: "${{name.upperCase()}}"),
                Divider(
                  color: AppColor.highlighlowest,
                  height: 1.h,
                  thickness: 1.h,
                ).paddingOnly(top: 10.h, bottom: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.pagePadding.left,
                    //
                  ),
                  child: Column(
                    spacing: 20.h,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  }
}

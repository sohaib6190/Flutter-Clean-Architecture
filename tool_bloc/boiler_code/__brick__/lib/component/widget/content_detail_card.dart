import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/features/order/quote_detail/widget/detail_tile.dart';
import 'package:skyl/resource/app_color.dart';
import 'package:skyl/utils/extension/app_context.dart';

class ContentDetailCard extends StatelessWidget {
  final String? title;
  final Map<String, String> data;
  final bool isDoc;
  final bool isDark;
  const ContentDetailCard({
    super.key,
    required this.data,
    this.title,
    this.isDoc = false,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22.h),
      decoration: BoxDecoration(
        color: isDark ? AppColor.highlightGlass : AppColor.white,
        borderRadius: BorderRadius.circular(10.r),
        // border: isDark
        //     ? Border(
        //         left: BorderSide(color: AppColor.base),
        //         top: BorderSide(color: AppColor.base),
        //       )
        //     : null,
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColor.white.withValues(alpha: 0.1)
                : AppColor.black.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          title == null
              ? const SizedBox.shrink()
              : Content(
                  data: title.toString(),
                  size: 16,
                  textStyle: context.subHeadingText,
                  color: isDark ? AppColor.white : AppColor.black,
                ).paddingOnly(bottom: 10),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) {
              final iteration = data.entries.elementAt(index);
              if (iteration.value.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(height: 15.h);
            },
            itemBuilder: (context, index) {
              final iteration = data.entries.elementAt(index);
              if (iteration.value.isEmpty) {
                return const SizedBox.shrink();
              }
              return DetailTile(
                isDark: isDark,
                isDoc: isDoc,
                title: iteration.key.toString(),
                detail: iteration.value.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}

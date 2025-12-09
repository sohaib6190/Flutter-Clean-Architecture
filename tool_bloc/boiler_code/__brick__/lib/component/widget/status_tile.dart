import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/component/text/content.dart';
import 'package:skyl/utils/extension/app_context.dart';
import 'package:skyl/utils/utils.dart';

class StatusTile extends StatelessWidget {
  final dynamic status;
  const StatusTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 0.25.sw),
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: Utils.getStatusdValues(status).$2,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Content(
        data: Utils.getStatusdValues(status).$1,
        size: 11,
        maxLines: 1,
        textStyle: context.bodyText,
        overflow: TextOverflow.ellipsis,
        color: Utils.getStatusdValues(status).$3,
      ),
    );
  }
}

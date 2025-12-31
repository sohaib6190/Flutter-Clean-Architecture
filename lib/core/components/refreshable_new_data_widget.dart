import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'no_data_widget.dart';

class RefreshableNoDataView extends StatelessWidget {
  final String title;
  final bool isError;
  final VoidCallback? onRetry;
  final Future<void> Function()? onRefresh;

  const RefreshableNoDataView({
    super.key,
    required this.title,
    this.isError = false,
    this.onRetry,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh ?? () async {},
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: NoDataWidget.noBorderLarge(
                      title: title,
                      verticalPadding: 20.h,
                      isError: isError,
                      onRetry: onRetry,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

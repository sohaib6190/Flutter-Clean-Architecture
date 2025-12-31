import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemCardSkeleton extends StatelessWidget {
  final int? itemCount;
  final bool? isShowSecondSubTitle;

  const ItemCardSkeleton({
    super.key,
    this.itemCount,
    this.isShowSecondSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;
    final highlightColor = Colors.grey.shade100;
    final blockColor = Colors.grey.shade200;

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: itemCount ?? 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.verticalSpace,

                /// Top Row (Item Name & Code)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _shimmerBlock(
                        width: 160.w,
                        height: 22.h,
                        color: blockColor,
                      ),
                      _shimmerBlock(
                        width: 60.w,
                        height: 22.h,
                        color: blockColor,
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,

                /// Middle Row (Qty, Open Qty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _shimmerBlock(
                        width: 60.w,
                        height: 15.h,
                        color: blockColor,
                      ),
                      _shimmerBlock(
                        width: 60.w,
                        height: 15.h,
                        color: blockColor,
                      ),
                    ],
                  ),
                ),
                12.verticalSpace,

                if (isShowSecondSubTitle ?? false) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: _shimmerBlock(
                      width: 80.w,
                      height: 15.h,
                      color: blockColor,
                    ),
                  ),
                  12.verticalSpace,
                ],

                /// Bottom blue bar (UOM section)
                _shimmerBlock(
                  width: double.infinity,
                  height: 25.h,
                  color: blockColor,
                  radius: 6.r,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _shimmerBlock({
    required double width,
    required double height,
    required Color color,
    double radius = 4,
    BorderRadius? borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 0.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
      ),
    );
  }
}

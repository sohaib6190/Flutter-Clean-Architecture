import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class InventoryTransferSkeleton extends StatelessWidget {
  final int? itemCount;
  const InventoryTransferSkeleton({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: itemCount ?? 4,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _shimmerWidget();
        },
        separatorBuilder: (context, index) => 0.verticalSpace,
      ),
    );
  }

  Widget _shimmerWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSideColumn(),
                _buildCenterSkeletonIcon(),
                _buildSideColumn(true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSideColumn([bool isEnd = false]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isEnd == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        _shimmerBox(width: 40.w, height: 14.h),
        SizedBox(height: 6.h),
        _shimmerBox(width: 80.w, height: 18.h),
        SizedBox(height: 6.h),
        _shimmerBox(width: 60.w, height: 14.h),
      ],
    );
  }

  Widget _buildCenterSkeletonIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circleWidget(),
        _dottedLine(isVertical: false),
        SizedBox(height: 4.h),
        // Circle shimmer
        _centerCircleWidget(),
        SizedBox(height: 4.h),
        // Dotted line below
        _dottedLine(isVertical: false),
        _circleWidget(),
      ],
    );
  }

  Shimmer _centerCircleWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  Shimmer _circleWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 10.r,
        height: 10.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  Widget _dottedLine({required bool isVertical}) {
    return SizedBox(
      width: isVertical ? 2.w : 40.w,
      height: isVertical ? 40.h : 2.h,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dotCount = (constraints.maxWidth / 4).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              dotCount,
              (_) => Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _shimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}

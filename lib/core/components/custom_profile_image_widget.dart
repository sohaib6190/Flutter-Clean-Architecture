import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/asset_paths.dart';
import '../enums/file_type.dart';
import '../extensions/context_extensions.dart';
import 'custom_image_widget.dart';


class CustomProfileImageWidget extends StatefulWidget {
  final String? imagePath, placeHolderImage, assetImagePath;
  final VoidCallback? onUploadImageTap;

  final Color? borderColor, containerColor;
  final bool? isBorder;
  final bool? showUploadIcon;
  final MediaPathType mediaPathType;
  final double? width, height, padding, borderWidth;

  const CustomProfileImageWidget({
    super.key,
    this.imagePath,
    this.onUploadImageTap,
    this.showUploadIcon = true,
    this.width,
    this.containerColor,
    this.borderWidth,
    this.isBorder = true,
    this.padding,
    this.height,
    this.placeHolderImage,
    this.borderColor = Colors.white,
    this.assetImagePath = AppAssets.userPlaceHolder,
    required this.mediaPathType,
  });

  CustomProfileImageWidget.smallAvatar({
    super.key,
    required String this.imagePath,
    this.onUploadImageTap,
    this.placeHolderImage,
  }) : mediaPathType = MediaPathType.network,
       width = 50.w,
       height = 50.w,
       isBorder = true,
       showUploadIcon = false,
       borderColor = Colors.white,
       containerColor = Colors.white,
       borderWidth = 2.0,
       padding = 0.0,
       assetImagePath = AppAssets.userPlaceHolder;

  @override
  State<CustomProfileImageWidget> createState() =>
      _CustomProfileImageWidgetState();
}

class _CustomProfileImageWidgetState extends State<CustomProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      // alignment: Alignment.center,
      children: [
        _userProfileImageWidget(context: context),
        if (widget.showUploadIcon == true) _uploadImageContainerWidget(),
      ],
    );
  }

  Widget _userProfileImageWidget({BuildContext? context}) {
    return GestureDetector(
      onTap: () {
        //_navigateToViewFullImage();
      },
      child: Container(
        width: widget.width ?? 125.w,
        height: widget.height ?? 125.w,
        decoration: BoxDecoration(
          color: widget.containerColor ?? Colors.white,
          shape: BoxShape.circle,
          border:
              widget.isBorder == true
                  ? Border.all(
                    width: widget.borderWidth ?? 2.0,
                    color: widget.borderColor ?? Colors.white,
                  )
                  : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.padding ?? 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CustomImageWidget(
              imagePath: widget.imagePath,
              isClipped: true,
              isViewFallBackAsset: true,
              fit: BoxFit.cover,
              placeHolderImagePath: widget.placeHolderImage,
              mediaPathType: widget.mediaPathType,
            ),
          ),
        ),
      ),
    );
  }

  // void _navigateToViewFullImage() {
  //   Utils.onTapViewImage(
  //     context: context,
  //     image: widget.imagePath,
  //     mediaPathType: widget.mediaPathType,
  //   );
  // }

  Widget _uploadImageContainerWidget() {
    return Positioned(
      right: 0.w,
      bottom: 0.h,
      child: GestureDetector(
        onTap: widget.onUploadImageTap,
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: context.primaryColor),
          ),
          child: Icon(
            Icons.camera_alt,
            //color: AppPalette.primaryColor,
            color: context.primaryColor,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}

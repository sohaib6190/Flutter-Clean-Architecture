import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/asset_paths.dart';
import '../enums/file_type.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imagePath;
  final MediaPathType mediaPathType;
  final bool? isViewFallBackAsset, showFailedAssetImage;
  final VoidCallback? onTap;
  final bool? isFullUrl;
  final String? placeHolderImagePath;
  final BoxFit? fit;
  final bool isClipped;

  const CustomImageWidget({
    super.key,
    this.imagePath,
    this.mediaPathType = MediaPathType.network,
    this.onTap,
    this.fit,
    this.isClipped = false,
    this.placeHolderImagePath,
    this.showFailedAssetImage = true,
    this.isViewFallBackAsset,
    this.isFullUrl,
  });

  @override
  Widget build(BuildContext context) {
    return isClipped ? ClipOval(child: _imageWidget()) : _imageWidget();
  }

  /// **Main Image Widget**
  Widget _imageWidget() {
    switch (mediaPathType) {
      case MediaPathType.asset:
        return _buildAssetImage();
      case MediaPathType.file:
        return _buildFileImage();
      case MediaPathType.network:
        return _buildNetworkImage();
    }
  }

  /// **Asset Image**
  Widget _buildAssetImage() {
    return (imagePath ?? "").isNotEmpty
        ? Image.asset(imagePath!, fit: fit ?? BoxFit.cover)
        : isViewFallBackAsset == true
        ? Image.asset(
          placeHolderImagePath ?? AppAssets.placeholderImage,
          fit: fit ?? BoxFit.cover,
        )
        : _buildPlaceholder();
  }

  /// **File Image (Local)**
  Widget _buildFileImage() {
    if (imagePath == null || imagePath!.isEmpty) {
      return _buildPlaceholder();
    }
    return GestureDetector(
      onTap: onTap,
      child: Image.file(
        File(imagePath!),
        fit: fit ?? BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      ),
    );
  }

  /// **Network Image (With Placeholder & Shimmer)**
  Widget _buildNetworkImage() {
    final String imageUrl =
        isFullUrl == true ? (imagePath ?? "") : imagePath ?? "";
    // : APIBase.s3Bucket + (imagePath ?? "");

    return GestureDetector(
      onTap: onTap,
      child: Image.network(
        imageUrl,
        fit: fit ?? BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildShimmerEffect();
        },
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      ),
    );
  }

  /// **Shimmer Effect for Loading**
  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(color: Colors.grey),
    );
  }

  /// **Fallback Placeholder Image**
  Widget _buildPlaceholder() {
    return Image.asset(
      placeHolderImagePath ?? AppAssets.placeholderImage,
      fit: fit ?? BoxFit.cover,
    );
  }
}

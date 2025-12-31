import 'package:flutter/material.dart';

import '../constants/asset_paths.dart';


class BackgroundImageWrapper extends StatelessWidget {
  final Widget child;
  final String? imagePath;

  const BackgroundImageWrapper({
    super.key,
    required this.child,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(imagePath ?? AppAssets.authBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

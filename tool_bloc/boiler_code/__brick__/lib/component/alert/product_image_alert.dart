import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyl/component/image/app_network_image.dart';
import 'package:skyl/resource/app_asset.dart';
import 'package:skyl/resource/app_color.dart';

class ProductImagesView extends StatefulWidget {
  final List<String> images;
  const ProductImagesView({super.key, required this.images});

  @override
  State<ProductImagesView> createState() => _ProductImagesViewState();
}

class _ProductImagesViewState extends State<ProductImagesView> {
  late CarouselSliderController _controller;
  int _current = 0;

  @override
  void initState() {
    _controller = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image.asset(AppAsset.tshirtAltAlt, width: 0.75.sw, fit: BoxFit.cover),
        SizedBox(
          // height: 0.2.sh,
          width: 0.8.sw,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 0.3.sh,

              // aspectRatio: 2 / 2.7,
              // viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeFactor: 00,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            // carouselController: _controller,
            itemCount: widget.images.length,

            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
                  final iteration = widget.images[itemIndex];
                  return AppImage(
                    imageUrl: iteration,
                    size: double.infinity,
                    borderRadius: 5.5,
                    shape: RoundedRectangleBorder(),
                  );
                },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              // onTap: () =>
              //     _controller.animateToPage(entry),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primarylight),
                  color: (AppColor.primarylight).withValues(
                    alpha: _current == entry.key ? 0.9 : 0.2,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        // Row(
        //   spacing: 5,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 16.w,
        //       height: 8.h,
        //       decoration: BoxDecoration(
        //         color: Colors.blue[700],
        //         borderRadius: BorderRadius.circular(8.h),
        //       ),
        //     ),

        //     Container(
        //       width: 8.w,
        //       height: 8.h,
        //       decoration: BoxDecoration(
        //         color: Colors.blue[100],
        //         shape: BoxShape.circle,
        //       ),
        //     ),

        //     Container(
        //       width: 8.w,
        //       height: 8.h,
        //       decoration: BoxDecoration(
        //         color: Colors.blue[100],
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

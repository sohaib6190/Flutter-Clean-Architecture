import 'package:flutter/material.dart';



class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  final double size;

  const CustomCircularProgressIndicator({
    super.key,
    this.color,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator()
    );
  }
}

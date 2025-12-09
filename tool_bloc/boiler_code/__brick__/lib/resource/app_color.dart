import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _instance = AppColor._internal();

  factory AppColor(){
    return _instance;
  }

  static Color  white = const Color(0xFFFFFFFF);
  static Color  black = const Color(0xFF000000);



}
import 'package:flutter/material.dart';

import '../app_colors.dart';

class HomeScreenTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle address = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.35),
  );
  static const TextStyle appbar = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static const TextStyle appbarTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
    color: AppColors.blackColor,
  );
  static const TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static const TextStyle banner = TextStyle(
      fontFamily: 'Inter',
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const TextStyle subtitle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey);

  static const TextStyle subtitlePurple = TextStyle(
      fontFamily: 'Inter',
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightPurpleColor);
}

import 'package:flutter/material.dart';

import '../app_colors.dart';

class ConstructorTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    color: Colors.grey,
    fontWeight: FontWeight.w700,
  );

  static TextStyle subtitle = const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.greyColor);

  static const TextStyle rating = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const TextStyle inputText = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const TextStyle appBar = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static const TextStyle appBarTitle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static const TextStyle add = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: AppColors.lightPurpleColor);

  static const TextStyle lable = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
  static TextStyle priority = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle snackBar = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightPurpleColor,
  );
}

import 'package:flutter/material.dart';
import 'package:travel_organiser/consts/app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22.0,

    fontWeight: FontWeight.w600,
  );
  static TextStyle description = const TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle button = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    height: 20.0 / 18.0,
  );
}

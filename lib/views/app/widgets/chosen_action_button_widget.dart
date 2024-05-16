import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.blackColor,
  });

  final String text;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.08,
        left: size.width * 0.015,
        right: size.width * 0.015,
      ),
      child: SizedBox(
        width: size.width * 0.95,
        height: size.height * 0.055,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: OnboardingTextStyle.button,
          ),
        ),
      ),
    );
  }
}

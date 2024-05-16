import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts/app_text_styles/home_screen_text_style.dart';

class ThingItemWidget extends StatelessWidget {
  final String name;
  final String category;
  final String categoryIcon;
  final int quantity;
  final double weight;
  final Color color;

  const ThingItemWidget(
      {Key? key,
      required this.name,
      required this.category,
      required this.categoryIcon,
      required this.quantity,
      required this.weight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: HomeScreenTextStyle.title,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                SvgPicture.asset(
                  categoryIcon,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8.0),
                Text(
                  category,
                  style: HomeScreenTextStyle.title,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/amount.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '$quantity',
                  style: HomeScreenTextStyle.title,
                ),
                const SizedBox(width: 16.0),
                SvgPicture.asset(
                  'assets/icons/weight.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '$weight',
                  style: HomeScreenTextStyle.title,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

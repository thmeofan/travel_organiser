import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_organiser/consts/app_text_styles/constructor_text_style.dart';

import '../../../consts/app_colors.dart';

class CategoryWidget extends StatefulWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final Function(String) onCategorySelected;

  const CategoryWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onCategorySelected,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: () {
          widget.onCategorySelected(widget.label);
        },
        child: Container(
          height: size.height * 0.06,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.blackColor
                : AppColors.blackColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.iconPath,
                height: 20,
                width: 20,
                color: widget.isSelected ? Colors.white : AppColors.blackColor,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: ConstructorTextStyle.subtitle,
              ),
              const Spacer(),
              if (widget.isSelected)
                SvgPicture.asset(
                  'assets/icons/check_circle.svg',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

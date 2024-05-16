import 'package:flutter/material.dart';

class ColorCircle extends StatefulWidget {
  final Color color;
  final bool isSelected;
  final ValueChanged<Color> onColorSelected;

  ColorCircle({
    required this.color,
    required this.isSelected,
    required this.onColorSelected,
  });

  @override
  _ColorCircleState createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = true;
        });
        widget.onColorSelected(widget.color);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
          border:
              _isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
      ),
    );
  }
}

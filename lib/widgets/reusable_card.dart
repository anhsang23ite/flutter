import 'package:flutter/material.dart';

/// Widget Card tái sử dụng cho BMI Calculator
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? child;
  final VoidCallback? onPress;
  final double? height;

  const ReusableCard({
    Key? key,
    required this.colour,
    this.child,
    this.onPress,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
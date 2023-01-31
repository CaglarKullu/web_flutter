import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 1.w,
      height: 1.w,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(1.w)),
    );
  }
}

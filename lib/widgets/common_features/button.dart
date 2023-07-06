import 'package:caglar_portfolio/consts/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    bool isLaptopScreen = (width > 769);
    return Container(
      width: (isLaptopScreen) ? width / 15 : width / 8,
      height: height / 20,
      decoration: BoxDecoration(
        color: isSelected ? Consts.kButtonSelected : Consts.kButtonUnselected,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(fontSize: isLaptopScreen ? 14 : 10),
        ),
      ),
    );
  }
}

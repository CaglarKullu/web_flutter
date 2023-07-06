import 'package:caglar_portfolio/consts/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarButton extends ConsumerWidget {
  final List<bool> isSelected;
  final int index;
  final String buttonName;
  const AppBarButton(
      {required this.isSelected,
      super.key,
      required this.index,
      required this.buttonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color:
          isSelected[index] ? Consts.kButtonSelected : Consts.kButtonUnselected,
      child: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Center(
          child: Text(buttonName,
              style: TextStyle(
                color: isSelected[index]
                    ? Consts.kPrimaryColor
                    : Consts.kSecondaryColor,
                fontSize: 16.sp,
              )),
        ),
      ),
    );
  }
}

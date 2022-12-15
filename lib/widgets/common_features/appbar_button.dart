import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/const.dart';

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
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      child: Center(
        child: Text(buttonName,
            style: TextStyle(
              color: isSelected[index]
                  ? Consts.selectedStyle
                  : Consts.unselectedStyle,
              fontSize: 16.sp,
            )),
      ),
    );
  }
}

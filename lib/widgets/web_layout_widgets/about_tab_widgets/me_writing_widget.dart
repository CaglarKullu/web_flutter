import 'package:caglar_portfolio/consts/const.dart';
import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeWriting extends ConsumerWidget {
  const MeWriting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    bool isLaptopScreen = (size.width > 769);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: isLaptopScreen ? size.width / 10 : size.width,
        child: Center(
          child: RichText(
              text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: "I'm Caglar Kullu, ",
                  style:
                      TextStyle(fontSize: 15.sp, color: Consts.kPrimaryColor)),
              TextSpan(
                  text: "Flutter Devopler ",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Consts.kButtonUnselected,
                      fontWeight: FontWeight.bold)),
              (size.width > 500)
                  ? const TextSpan(text: "             ")
                  : const TextSpan(text: " "),
              TextSpan(
                  text:
                      "I can create mobile applications, web sites and desktop applications according to your desires.",
                  style: TextStyle(fontSize: 15.sp, color: Colors.white)),
            ],
          )),
        ),
      ),
    );
  }
}

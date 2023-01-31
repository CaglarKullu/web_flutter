import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileMeWriting extends ConsumerWidget {
  const MobileMeWriting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: size.width / 10,
        child: Center(
          child: RichText(
              text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: "I'm Caglar Kullu, ",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white)),
              TextSpan(
                  text: "Flutter Devopler ",
                  style: TextStyle(fontSize: 25.sp, color: Colors.amber)),
              (size.width > 500)
                  ? const TextSpan(text: "             ")
                  : const TextSpan(text: " "),
              TextSpan(
                  text:
                      "I can create mobile applications, web sites and desktop applications according to your desires.",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white)),
            ],
          )),
        ),
      ),
    );
  }
}

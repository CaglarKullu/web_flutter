import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';

class MeWriting extends ConsumerWidget {
  const MeWriting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: size.width / 10,
        height: size.height,
        child: Center(
          child: RichText(
              text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: "I'm Caglar Kullu, ",
                  style: TextStyle(fontSize: 15.sp, color: Colors.white)),
              TextSpan(
                  text: "Flutter Devopler ",
                  style: TextStyle(fontSize: 17.sp, color: Colors.amber)),
              const TextSpan(text: "             "),
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

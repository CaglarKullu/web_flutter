import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:web_demo/consts/providers.dart';

import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/me_photo.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/me_writing_widget.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/my_skills.dart';

class MobileAboutPage extends ConsumerWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              flex: 1,
              child: SizedBox(width: size.width / 3, child: const MeWriting())),
          SizedBox(
            width: size.width / 10,
          ),
          const Flexible(flex: 1, child: MePhoto()),
          SizedBox(
            width: size.width / 10,
          ),
          const Flexible(child: MySkills()),
        ],
      ),
    ));
  }
}

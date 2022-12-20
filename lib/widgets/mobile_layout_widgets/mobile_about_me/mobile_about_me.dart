import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_photo.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_writing_widget.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/my_skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileAboutPage extends ConsumerWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex: 1,
            child: SizedBox(width: size.width, child: const MeWriting())),
        const Flexible(flex: 1, child: MePhoto()),
        const Flexible(flex: 1, child: MySkills()),
      ],
    );
  }
}

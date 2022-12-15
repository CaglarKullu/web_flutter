import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_photo.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_writing_widget.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/my_skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return SafeArea(
        child: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(flex: 1, child: MeWriting()),
          SizedBox(
            width: size.width / 30,
          ),
          const Flexible(flex: 1, child: MePhoto()),
          SizedBox(
            width: size.width / 30,
          ),
          const Flexible(child: MySkills()),
        ],
      ),
    ));
  }
}

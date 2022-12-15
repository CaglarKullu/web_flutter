import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/gridview_item_widget.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/me_photo.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/me_writing_widget.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab_widgets/my_skills.dart';

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
          const MeWriting(),
          SizedBox(
            width: size.width / 30,
          ),
          const MePhoto(),
          SizedBox(
            width: size.width / 30,
          ),
          const MySkills(),
        ],
      ),
    ));
  }
}

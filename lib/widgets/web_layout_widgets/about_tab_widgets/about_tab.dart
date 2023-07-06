import 'package:caglar_portfolio/consts/const.dart';
import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/router/app_route_consts.dart';
import 'package:caglar_portfolio/widgets/common_features/button.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_photo.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/me_writing_widget.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/my_skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    bool isLapTopScreen = (size.width > 769);
    return Scaffold(
      backgroundColor: Consts.kAppBackground,
      appBar: AppBar(
        backgroundColor: Consts.backgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isLapTopScreen
                ? SizedBox(
                    width: size.width / 5,
                  )
                : const SizedBox(),
            CustomButton(
              isSelected: false,
              label: 'About',
              onTap: () => context.goNamed(RouteConsts.aboutRouteName),
            ),
            CustomButton(
              isSelected: false,
              label: 'Portolio',
              onTap: () {},
            ),
            CustomButton(
              isSelected: false,
              label: 'Contact',
              onTap: () => context.goNamed(RouteConsts.contactRouteName),
            ),
          ],
        ),
      ),
      body: isLapTopScreen
          ? Row(
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
            )
          : SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Column(
                  children: const [
                    Flexible(flex: 1, child: MeWriting()),
                    Flexible(flex: 1, child: MePhoto()),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(child: MySkills()),
                  ],
                ),
              ),
            ),
    );
  }
}

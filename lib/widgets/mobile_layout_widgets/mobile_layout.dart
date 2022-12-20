import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_widget.dart';
import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_about_me/mobile_about_me.dart';

import 'package:caglar_portfolio/widgets/web_layout_widgets/contact_tab_widgets/contact_tab.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/portfolio_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});
  void jumpWidget(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    final mobileAboutKey = ref.watch(mobileAboutKeyProvider);
    final mobilePortfolioKey = ref.watch(mobilePortfolioKeyProvider);
    final mobileContactKey = ref.watch(mobileContactKeyProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarWidget(),
        ),
        body: ListView(
          children: [
            SizedBox(
              width: size.width / 2,
              height: size.height,
              child: MobileAboutPage(
                key: mobileAboutKey,
              ),
            ),
            PortfolioPage(
              key: mobilePortfolioKey,
            ),
            ContactPage(
              key: mobileContactKey,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_widget.dart';
import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_about_me/mobile_about_me.dart';
import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_contact/mobile_contact_tab.dart';
import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_portfolio_widgets/mobile_portfolio_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileLayout extends ConsumerWidget {
  final ScrollController _controller = ScrollController();

  MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    final mobileAboutKey = ref.watch(mobileAboutKeyProvider);
    final mobilePortfolioKey = ref.watch(mobilePortfolioKeyProvider);
    final mobileContactKey = ref.watch(mobileContactKeyProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(
            mobileController: _controller,
            webController: null,
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(203, 249, 255, 1),
                Color.fromRGBO(222, 249, 255, 1),
                Color.fromRGBO(230, 251, 254, 1),
                Color.fromRGBO(252, 252, 252, 1),
              ],
            ),
          ),
          child: ListView(
            controller: _controller,
            children: [
              SizedBox(
                width: size.width / 2,
                height: size.height,
                child: MobileAboutPage(
                  key: mobileAboutKey,
                ),
              ),
              MobilePortfolioPage(
                key: mobilePortfolioKey,
              ),
              MobileContactPage(
                key: mobileContactKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

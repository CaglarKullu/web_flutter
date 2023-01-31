import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_widget.dart';

import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/about_tab.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/contact_tab_widgets/contact_tab.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/portfolio_widgets/portfolio_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebLayout extends ConsumerWidget {
  final ScrollController _controller = ScrollController();
  WebLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    final aboutKey = ref.watch(aboutKeyProvider);
    final portfolioKey = ref.watch(portfolioKeyProvider);
    final contactKey = ref.watch(contactKeyProvider);
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(
            webController: _controller,
            mobileController: null,
          ),
        ),
        body: ListView(
          controller: _controller,
          children: [
            SizedBox(
              width: size.width / 2,
              height: size.height,
              child: AboutPage(
                key: aboutKey,
              ),
            ),
            PortfolioPage(
              key: portfolioKey,
            ),
            ContactPage(
              key: contactKey,
            )
          ],
        ));
  }
}

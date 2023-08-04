import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_widget.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/about_tab.dart';

import 'package:caglar_portfolio/widgets/web_layout_widgets/portfolio_widgets/portfolio_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebLayout extends ConsumerWidget {
  final ScrollController _controller = ScrollController();
  WebLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return const Scaffold(
      body: Center(
        child: AboutPage(),
      ),
    );
  }
}

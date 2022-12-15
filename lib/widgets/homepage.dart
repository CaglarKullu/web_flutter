import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_layout.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/web_layout.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isWeb;
        if (constraints.maxWidth < 501) {
          isWeb = false;
        } else {
          isWeb = true;
        }
        return isWeb == true ? const WebLayout() : const MobileLayout();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web_demo/widgets/mobile_layout_widgets/mobile_layout.dart';
import 'package:web_demo/widgets/web_layout_widgets/web_layout.dart';

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

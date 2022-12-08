import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';
import 'package:web_demo/widgets/web_layout_widgets/about_tab.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final isSelected = ref.watch(appbarToggleButtonStateProvider);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(isSelected: isSelected, children: [
                  Center(
                    child: AppBarButton(
                      buttonName: "About",
                      funtion: () => Navigator.pushNamed(context, '/about'),
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  Center(
                    child: AppBarButton(
                      buttonName: "Portfolio",
                      funtion: () =>
                          Navigator.popAndPushNamed(context, '/portfolio'),
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  Center(
                    child: AppBarButton(
                      buttonName: "Contact",
                      funtion: () => Navigator.pushNamed(context, '/contact'),
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ]),
              ],
            );
          },
        ),
      ),
      body: Center(
        child: Text("Portfolio"),
      ),
    ));
  }
}

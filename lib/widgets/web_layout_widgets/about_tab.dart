import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';

class AboutTab extends ConsumerWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.refresh(sizeProviderProvider(context));
    late final String screenTypeText;
    switch (Device.screenType) {
      case ScreenType.mobile:
        screenTypeText = "My screen's type is Mobile";
        break;
      case ScreenType.tablet:
        screenTypeText = "My screen's type is Tablet";
        break;
      // ScreenType can only be desktop when `maxTabletWidth`
      // is set in `ResponsiveSizer`
      case ScreenType.desktop:
        screenTypeText = "My screen's type is Desktop";
        break;
    }
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
                        funtion: () =>
                            Navigator.popAndPushNamed(context, '/about'),
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                    Center(
                      child: AppBarButton(
                        buttonName: "Portfolio",
                        funtion: () =>
                            Navigator.pushNamed(context, '/portfolio'),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "About me",
                style: TextStyle(fontSize: 15.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarButton extends TextButton {
  final VoidCallback funtion;
  final String buttonName;
  final TextStyle textStyle;
  AppBarButton(
      {required this.textStyle,
      required this.buttonName,
      required this.funtion,
      super.key})
      : super(
          child: Builder(builder: (context) {
            return Text(
              buttonName,
              style: textStyle,
            );
          }),
          onPressed: funtion,
        );
}

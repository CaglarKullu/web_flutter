import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarButton(
                  buttonName: "About",
                  funtion: () => Navigator.pushNamed(context, '/about')),
              AppBarButton(
                  buttonName: "Portfolio",
                  funtion: () => Navigator.pushNamed(context, '/about')),
              AppBarButton(
                  buttonName: "Contact",
                  funtion: () => Navigator.pushNamed(context, '/about')),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 20.h, // or 12.5.h
            width: 100.w, // or Adaptive.w(50)
            color: Colors.black,
          ),
          Text(
            "This text is responsive",
            style: TextStyle(fontSize: 18.sp), // or Adaptive.sp(12)
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              Size size = ref.refresh(sizeProviderProvider(context));

              MediaQuery.of(context).size;
              return Text(
                "w=${size.width} h=${size.height}",
                style: TextStyle(fontSize: 12.sp),
              );
            },
          ),
          Device.orientation == Orientation.portrait
              ? const Text("My orientation is Portrait")
              : const Text("My orientation is Landscape"),
          Text(screenTypeText),
        ],
      ),
    );
  }
}

class AppBarButton extends TextButton {
  final VoidCallback funtion;
  final String buttonName;
  AppBarButton({required this.buttonName, required this.funtion, super.key})
      : super(
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: funtion,
        );
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'widgets/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation,
            ScreenType screenType) {
          return MaterialApp(
            scrollBehavior: AppScrollBehavior(),
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(useMaterial3: true),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

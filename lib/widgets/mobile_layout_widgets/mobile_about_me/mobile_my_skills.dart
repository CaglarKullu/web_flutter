import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/gridview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileMySkills extends ConsumerWidget {
  const MobileMySkills({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Center(
            child: Text(
              "My Skills",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.fill,
          child: Center(
            child: SizedBox(
              width: size.width > 500 ? size.width / 3 : size.width * 0.8,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: const [
                  GridviewItem(
                      url:
                          "https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Dart_programming_language_logo.svg/2560px-Dart_programming_language_logo.svg.png"),
                  GridviewItem(
                      url:
                          "https://cdn.iconscout.com/icon/free/png-256/sqlite-282687.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Firebase_Logo.svg/1200px-Firebase_Logo.svg.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Kotlin_logo.svg/2560px-Kotlin_logo.svg.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/1280px-Git-logo.svg.png")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

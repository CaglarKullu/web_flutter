import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';
import 'package:web_demo/widgets/web_layout_widgets/appbar_button.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(buttonStateProvider);
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              borderWidth: 0,
              borderColor: Colors.black12,
              isSelected: isSelected,
              onPressed: (index) {
                ref.refresh(buttonStateProvider.notifier).onPressed(index);
                ref.read(indexProvider.notifier).state = index;
              },
              children: [
                AppBarButton(
                    isSelected: isSelected, index: 0, buttonName: "About"),
                AppBarButton(
                  buttonName: 'Portfolio',
                  index: 1,
                  isSelected: isSelected,
                ),
                AppBarButton(
                  isSelected: isSelected,
                  index: 2,
                  buttonName: "Contact",
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends ConsumerWidget {
  final ScrollController? mobileController;
  final ScrollController? webController;
  const AppBarWidget(
      {super.key, required this.mobileController, required this.webController});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(buttonStateProvider);
    final size = ref.watch(sizeProviderProvider(context));
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        Future<void> jumpPage(int index) async {
          Future.delayed(const Duration(milliseconds: 30), () {
            if (size.width > 500) {
              if (index == 0 && webController!.hasClients) {
                webController!.animateTo(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
              if (index == 1 && webController!.hasClients) {
                webController!.animateTo(
                  webController!.position.maxScrollExtent / 2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
              if (index == 2 && webController!.hasClients) {
                webController!.animateTo(
                  webController!.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            } else {
              if (index == 0 && mobileController!.hasClients) {
                mobileController!.animateTo(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
              if (index == 1 && mobileController!.hasClients) {
                mobileController!.animateTo(
                  mobileController!.position.maxScrollExtent / 2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
              if (index == 2 && mobileController!.hasClients) {
                mobileController!.animateTo(
                  mobileController!.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            }
          });
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              borderWidth: 0,
              borderColor: Colors.black12,
              isSelected: isSelected,
              onPressed: (index) async {
                ref.refresh(buttonStateProvider.notifier).onPressed(index);
                jumpPage(index);
                log(index.toString());
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

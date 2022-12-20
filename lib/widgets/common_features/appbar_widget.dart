import 'package:caglar_portfolio/consts/providers.dart';
import 'package:caglar_portfolio/widgets/common_features/appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(buttonStateProvider);
    final mobileAboutKey = ref.watch(mobileAboutKeyProvider);
    final mobilePorfolioKey = ref.watch(mobilePortfolioKeyProvider);
    final mobileContactKey = ref.watch(mobileContactKeyProvider);
    final aboutKey = ref.watch(aboutKeyProvider);
    final portfolioKey = ref.watch(portfolioKeyProvider);
    final contactKey = ref.watch(contactKeyProvider);
    Size size = ref.watch(sizeProviderProvider(context));
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        void jumpPage() async {
          int index = ref.watch(indexProvider);

          switch (index) {
            case 0:
              Scrollable.ensureVisible(
                (size.width > 500)
                    ? aboutKey.currentContext!
                    : mobileAboutKey.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
              break;

            case 1:
              Scrollable.ensureVisible(
                (size.width > 500)
                    ? portfolioKey.currentContext!
                    : mobilePorfolioKey.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
              break;

            case 2:
              Scrollable.ensureVisible(
                (size.width > 500)
                    ? contactKey.currentContext!
                    : mobileContactKey.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
              break;

            default:
              Scrollable.ensureVisible(
                (size.width > 500)
                    ? aboutKey.currentContext!
                    : mobileAboutKey.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
          }
        }

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
                jumpPage();
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

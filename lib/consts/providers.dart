import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeProvider extends StateNotifier<Size> {
  SizeProvider(BuildContext context)
      : super(Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height));
}

final sizeProviderProvider =
    StateNotifierProvider.family<SizeProvider, Size, BuildContext>(
        (ref, context) {
  return SizeProvider(context);
});

class ToggleButtonState extends StateNotifier<List<bool>> {
  ToggleButtonState() : super(List<bool>.generate(3, (int index) => false));
  void onPressed(int index) {
    for (int i = 0; i < state.length; i++) {
      state[i] = i == index;
    }
  }
}

final buttonStateProvider =
    StateNotifierProvider<ToggleButtonState, List<bool>>(
        (ref) => ToggleButtonState());
final indexProvider = StateProvider<int>((ref) => 0);

final mobileAboutKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));
final mobilePortfolioKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));
final mobileContactKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));
final aboutKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));
final portfolioKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));
final contactKeyProvider = Provider<GlobalKey>(((ref) => GlobalKey()));

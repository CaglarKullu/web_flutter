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

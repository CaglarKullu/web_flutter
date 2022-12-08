import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_demo/consts/const.dart';

import 'package:web_demo/consts/providers.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(buttonStateProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  selectedColor: Colors.amber,
                  isSelected: isSelected,
                  onPressed: (index) {
                    ref.refresh(buttonStateProvider.notifier).onPressed(index);
                    // ignore: void_checks
                    return Consts().pageRoute(index, context);
                  },
                  children: const [
                    Center(
                      child: Text("About"),
                    ),
                    Center(
                      child: Text("Portfolio"),
                    ),
                    Center(
                      child: Text("Contact"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        children: const [Center(child: Text("About"))],
      ),
    ));
  }
}

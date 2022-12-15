import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_demo/consts/const.dart';
import 'package:web_demo/consts/providers.dart';
import 'package:web_demo/widgets/common_features/appbar_widget.dart';

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(indexProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarWidget(),
      ),
      body: Consts().pageMobileLayout(index),
    ));
  }
}

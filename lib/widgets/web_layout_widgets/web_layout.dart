import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_demo/consts/const.dart';
import 'package:web_demo/consts/providers.dart';
import 'package:web_demo/widgets/common_features/appbar_widget.dart';

class WebLayout extends ConsumerWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(indexProvider);
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarWidget(),
        ),
        body: Consts().pageLayout(index));
  }
}

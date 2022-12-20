import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: const [
          Center(
              child:
                  SizedBox(width: 500, height: 500, child: Text("Portfolio")))
        ],
      ),
    );
  }
}

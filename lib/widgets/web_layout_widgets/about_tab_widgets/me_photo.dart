import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_demo/consts/providers.dart';

class MePhoto extends ConsumerWidget {
  const MePhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return Flexible(
      flex: 1,
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.8,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              '/Users/caglarkullu/development/Projects/Web_demo/web_demo/assets/me.jpeg',
              frameBuilder:
                  (context, child, frame, bool wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

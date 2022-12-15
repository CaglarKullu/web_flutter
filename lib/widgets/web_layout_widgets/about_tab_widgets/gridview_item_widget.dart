import 'package:cached_network_image/cached_network_image.dart';
import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridviewItem extends ConsumerWidget {
  final String url;
  const GridviewItem({required this.url, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.amberAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: url,
            placeholder: (context, url) => Container(
              width: size.width / 50,
              height: size.height / 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

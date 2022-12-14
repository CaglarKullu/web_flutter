import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_demo/consts/providers.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.refresh(sizeProviderProvider(context));
    return SafeArea(
        child: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: size.width / 10,
                height: size.height,
                child: Center(
                  child: RichText(
                      text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: "I'm Caglar Kullu, ",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white)),
                      TextSpan(
                          text: "Flutter Devopler ",
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.amber)),
                      const TextSpan(text: "             "),
                      TextSpan(
                          text:
                              "I can create mobile applications, web sites and desktop applications according to your desires.",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white)),
                    ],
                  )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 30,
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    '/Users/caglarkullu/development/Projects/Web_demo/web_demo/lib/assets/me.jpeg',
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
          ),
          SizedBox(
            width: size.width / 30,
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: size.width / 2,
              child: GridView.count(
                childAspectRatio: 1,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: const [
                  GridviewItem(
                      url:
                          "https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Dart_programming_language_logo.svg/2560px-Dart_programming_language_logo.svg.png"),
                  GridviewItem(
                      url:
                          "https://cdn.iconscout.com/icon/free/png-256/sqlite-282687.png"),
                  GridviewItem(
                      url:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Firebase_Logo.svg/1200px-Firebase_Logo.svg.png"),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

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

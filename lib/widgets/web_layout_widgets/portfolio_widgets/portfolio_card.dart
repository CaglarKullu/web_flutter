import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PortfolioCard extends ConsumerWidget {
  final String imageStr;
  final String cardMessage;
  final String heroTag;
  final String longText;
  const PortfolioCard({
    super.key,
    required this.imageStr,
    required this.cardMessage,
    required this.heroTag,
    required this.longText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.read(sizeProviderProvider(context));
    return InkWell(
      onTap: () {
        Navigator.push(context, HeroDialogRoute(builder: ((context) {
          return AlertDialog(
            content: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: size.height / 3,
                    child: Hero(
                      tag: heroTag,
                      child: Image(
                        image: AssetImage(imageStr),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(longText),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('RAD!'),
              ),
            ],
          );
        })));
      },
      child: Card(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.h)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 300.h,
              height: 300.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: Hero(
                    tag: heroTag, child: Image(image: AssetImage(imageStr))),
              ),
            ),
            SizedBox(
              width: 250.h,
              height: 300.h,
              child: Center(
                child: Text(
                  cardMessage,
                  maxLines: 10,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;
  @override
  String? get barrierLabel => "";
  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black26;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }
}

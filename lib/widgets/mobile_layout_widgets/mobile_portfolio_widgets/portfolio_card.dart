import 'package:caglar_portfolio/consts/const.dart';
import 'package:caglar_portfolio/consts/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePortfolioCard extends ConsumerWidget {
  final String imageStr;
  final String cardMessage;
  final String heroTag;
  final String textSpan1;
  final String textSpan2;
  final String textSpan3;
  final String url;

  const MobilePortfolioCard(
      {super.key,
      required this.imageStr,
      required this.cardMessage,
      required this.heroTag,
      required this.textSpan1,
      required this.textSpan2,
      required this.textSpan3,
      required this.url});
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = ref.read(sizeProviderProvider(context));
    return InkWell(
      onTap: () {
        Navigator.push(context, HeroDialogRoute(builder: ((context) {
          return AlertDialog(
            content: SizedBox(
              height: size.height / 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: size.height / 3,
                        child: Hero(
                          tag: heroTag,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image(
                              image: AssetImage(imageStr),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: textSpan1, style: Consts.normalText),
                              TextSpan(
                                  text: textSpan2, style: Consts.normalText),
                              TextSpan(text: textSpan3),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                elevation: 10,
                color: Consts.kGreyColor,
                child: TextButton(
                  onPressed: (() => _launchUrl(Uri.parse(url))),
                  child: Text('Download From Google Play',
                      style: Consts.normalText),
                ),
              ),
              Card(
                elevation: 10,
                color: Consts.kGreyColor,
                child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Cancel', style: Consts.normalText),
                ),
              ),
            ],
          );
        })));
      },
      child: FittedBox(
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
                      tag: heroTag,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image(image: AssetImage(imageStr)))),
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

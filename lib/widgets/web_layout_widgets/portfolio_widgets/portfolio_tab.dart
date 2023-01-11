import 'package:caglar_portfolio/widgets/web_layout_widgets/portfolio_widgets/portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'indicator.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final List<Widget> _portfolioPages = [
    const PortfolioCard(
      heroTag: "feedly",
      imageStr:
          "/Users/caglarkullu/development/Projects/Web_demo/web_demo/assets/images/feedly.png",
      cardMessage:
          "First sourdough dedicated app is finally on Google Play, introducing: FEEDLY! To get more information about the app and the techs used, click on",
      longText:
          'First sourdough dedicated app is finally on Google Play, introducing: FEEDLY! Most of us started sourdough baking in the hard times that we faced while spending enormous time in our homes and mostly in our kitchens. Though it felt like a trend for a period of time in several social media accounts, many people noticed the taste of a freshly baked bread and the feeling of accomplishment for making your own food, so they still continue baking their own bread. We know you might be one of them and we understand your need to have a mobile application that has everything to do with your sourdough. All you need is flour, water and "Feedly"./n/ntechs',
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: 30,
      height: 30,
      color: Colors.blue,
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: 30,
      height: 30,
      color: Colors.yellow,
    )
  ];

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.7);

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 300.h,
            child: PageView.builder(
                onPageChanged: (page) => setState(() {
                      activePage = page;
                    }),
                controller: _pageController,
                itemCount: _portfolioPages.length,
                itemBuilder: ((context, index) {
                  var _scale = activePage == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                    curve: Curves.ease,
                    duration: const Duration(
                      milliseconds: 350,
                    ),
                    tween: Tween(begin: _scale, end: _scale),
                    child: _portfolioPages[index % _portfolioPages.length],
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                  );
                })),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  _portfolioPages.length,
                  (index) => Indicator(
                        isActive: activePage == index ? true : false,
                      ))
            ],
          )
        ],
      ),
    );
  }
}

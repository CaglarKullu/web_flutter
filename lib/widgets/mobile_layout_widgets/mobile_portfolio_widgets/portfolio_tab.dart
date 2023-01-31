import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_portfolio_widgets/portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'indicator.dart';

class MobilePortfolioPage extends StatefulWidget {
  const MobilePortfolioPage({super.key});

  @override
  State<MobilePortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<MobilePortfolioPage> {
  final List<Widget> _portfolioPages = [
    const MobilePortfolioCard(
      heroTag: "feedly",
      imageStr: "assets/images/feedly.png",
      cardMessage:
          "First sourdough dedicated app is finally on Google Play, introducing: FEEDLY! To get more information about the app and the techs used, click on",
      textSpan1:
          'Teches Used: \n\n-SQLite\n\n-Database Design\n\n-UX and UI design\n\n-Riverpod (state management)\n ',
      textSpan2:
          "\nDownload this application you visit the link below to Google Play\n",
      textSpan3: "",
      url:
          'https://play.google.com/store/apps/details?id=com.ctksoftware.feedly',
    ),
    const MobilePortfolioCard(
        imageStr: "assets/images/surprise_me.png",
        cardMessage:
            "Surprise Me is the first mobile application that has been designed to allow you, its users, to find some random cocktail recipes in a whole bunch of cocktails.",
        heroTag: "Surpise Me",
        textSpan1:
            "Teches Used: \n\n-Firebase\n\n-Database Design\n\n-UX and UI design\n\n-Riverpod (state management)\n\n-API implementation\n\n-User authentication\n\n-User authentication\n",
        textSpan2:
            "\nDownload this application you visit the link below to Google Play\n",
        textSpan3: "",
        url:
            "https://play.google.com/store/apps/details?id=com.ctksoftware.surpriseme"),
    const MobilePortfolioCard(
        imageStr: "assets/images/coming_soon.jpeg",
        cardMessage: "cardMessage",
        heroTag: "coming soon",
        textSpan1: "textSpan1",
        textSpan2: "textSpan2",
        textSpan3: "",
        url: "url"),
  ];

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.7);

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
                child: Text(
              "My Portfolio",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            )),
          ),
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
          ),
          SizedBox(
            height: 100.h,
          )
        ],
      ),
    );
  }
}

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
    const PortfolioCard(
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
    const PortfolioCard(
        imageStr: "assets/images/tic_tac_toe.png",
        cardMessage:
            "Here is a small humble game coded by me 'TicTacToe' for proof of concept purposes. Have fun!",
        heroTag: "tictactoe",
        textSpan1: "You can play agains machine or with a friend",
        textSpan2: "",
        textSpan3: "",
        url: ""),
    const PortfolioCard(
        imageStr: "assets/images/coming_soon.jpeg",
        cardMessage: "cardMessage",
        heroTag: "coming soon",
        textSpan1: "textSpan1",
        textSpan2: "textSpan2",
        textSpan3: "",
        url: ""),
  ];

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.5);

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "My Portfolio",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
            ),
          ),
          SizedBox(
            height: 600.h,
            child: PageView.builder(
                onPageChanged: (page) => setState(() {
                      activePage = page;
                    }),
                controller: _pageController,
                itemCount: _portfolioPages.length,
                itemBuilder: ((context, index) {
                  var scale = activePage == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                    curve: Curves.ease,
                    duration: const Duration(
                      milliseconds: 350,
                    ),
                    tween: Tween(begin: scale, end: scale),
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

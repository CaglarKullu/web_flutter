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
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: 30,
      height: 30,
      color: Colors.red,
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
                itemBuilder: ((context, index) =>
                    _portfolioPages[index % _portfolioPages.length])),
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

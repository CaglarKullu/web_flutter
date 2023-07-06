import 'package:caglar_portfolio/widgets/web_layout_widgets/contact_tab_widgets/contact_tab.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/portfolio_widgets/portfolio_tab.dart';
import 'package:flutter/material.dart';

import '../widgets/mobile_layout_widgets/mobile_about_me/mobile_about_me.dart';
import '../widgets/web_layout_widgets/about_tab_widgets/about_tab.dart';

class Consts {
  static Color kAppBackground = const Color.fromRGBO(36, 82, 122, 1);
  static Color kButtonSelected = const Color.fromRGBO(164, 138, 109, 1);
  static Color kButtonUnselected = const Color.fromRGBO(238, 225, 207, 1);
  static Color kPrimaryColor = const Color.fromRGBO(240, 251, 255, 1);
  static Color kSecondaryColor = const Color.fromRGBO(89, 110, 121, 1);
  static Color unselectedStyle = Colors.grey;
  static Color selectedStyle = Colors.white;
  static Color backgroundColor = Colors.black12;
  static Color kWhiteColor = Colors.white;
  static Color kGreyColor = Colors.grey;
  static TextStyle normalText = TextStyle(color: kWhiteColor);

  pageRoute(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Navigator.popAndPushNamed(context, '/about');

      case 1:
        return Navigator.popAndPushNamed(context, '/portfolio');

      case 2:
        return Navigator.popAndPushNamed(context, '/contact');

      default:
        return Navigator.popAndPushNamed(context, '/about');
    }
  }

  Widget pageLayout(int index) {
    switch (index) {
      case 0:
        return const AboutPage();

      case 1:
        return const PortfolioPage();

      case 2:
        return const ContactPage();

      default:
        return const AboutPage();
    }
  }

  Widget pageMobileLayout(int index) {
    switch (index) {
      case 0:
        return const MobileAboutPage();

      case 1:
        return const PortfolioPage();

      case 2:
        return const ContactPage();

      default:
        return const AboutPage();
    }
  }
}

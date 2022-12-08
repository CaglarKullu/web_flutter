import 'package:flutter/material.dart';

class Consts {
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
}

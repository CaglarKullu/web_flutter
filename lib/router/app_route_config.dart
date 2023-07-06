import 'package:caglar_portfolio/widgets/common_features/error_page.dart';
import 'package:caglar_portfolio/widgets/homepage.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/about_tab_widgets/about_tab.dart';
import 'package:caglar_portfolio/widgets/web_layout_widgets/contact_tab_widgets/contact_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_consts.dart';

GoRouter getRouter(BuildContext context) {
  GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(
        name: RouteConsts.homeRouteName,
        path: '/',
        pageBuilder: ((context, state) =>
            const MaterialPage(child: MyHomePage())),
      ),
      GoRoute(
        name: RouteConsts.aboutRouteName,
        path: '/about',
        pageBuilder: ((context, state) =>
            const MaterialPage(child: AboutPage())),
      ),
      GoRoute(
        name: RouteConsts.contactRouteName,
        path: '/contact-us',
        pageBuilder: ((context, state) =>
            const MaterialPage(child: ContactPage())),
      ),
    ],
  );
  return router;
}

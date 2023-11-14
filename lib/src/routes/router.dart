import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:flutter/material.dart';

import '../routes/navigation__route.dart';

class Router {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final pathElements = settings.name?.split('/');
    if (pathElements![1] == '') return null;
    final page = NavigationRoute().pages[settings.name];
    switch (settings.name) {
      case NavigationRoute.LISTINGINTRO:
        print(settings.arguments);
        return MaterialPageRoute(builder: (_) {
          return ListingIntroPage(type: settings.arguments as ListingType);
        });
      default:
        if (page != null) return MaterialPageRoute(builder: (_) => page);
        return null;
    }
  }
}

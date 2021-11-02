import 'package:modular_1/app/ui/pages/login/view.dart';
import 'package:modular_1/app/ui/pages/main/view.dart';
import 'package:modular_1/app/ui/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Pages.main:
        return _buildRoute(settings, new MainPage());
      case Pages.login:
        return _buildRoute(settings, new LoginPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings? settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}

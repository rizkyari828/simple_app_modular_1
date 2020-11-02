import 'package:clean_arc_flutter/app/ui/pages/login/view.dart';
import 'package:clean_arc_flutter/app/ui/pages/main/view.dart';
import 'package:clean_arc_flutter/app/ui/pages/profilenew/view.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.main:
        return _buildRoute(settings, new MainPage());
      case Pages.login:
        return _buildRoute(settings, new LoginPage());
        case Pages.profile:
        return _buildRoute(settings, new ProfilenewPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}

import 'dart:async';
import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class SplashController extends BaseController {
  UserData? _userData;

  SplashController(this._userData) : super() {
    _navigate();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  _navigate() {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, () {
      Navigator.pushReplacementNamed(getContext(), Pages.login);
    });
  }
}

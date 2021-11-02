import 'package:modular_1/app/infrastructure/app_component.dart';
import 'package:modular_1/app/ui/pages/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashPage extends View {
  SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() =>
      new _SplashPageState(AppComponent.getInjector().get<SplashController>());
}

class _SplashPageState extends ViewState<SplashPage, SplashController> {
  _SplashPageState(this._controller) : super(_controller);

  SplashController _controller;

  late Image splashImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    splashImage = Image.asset(
      'lib/app/ui/assets/images/Lancong.png',
      width: 400,
      height: 400,
    );
    //_controller.checkDevice();
    precacheImage(splashImage.image, context);
  }

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                child: splashImage,
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}

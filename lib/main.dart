import 'dart:async';

import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/infrastructure/router.dart'
    as CustomRouter;
import 'package:clean_arc_flutter/app/ui/pages/splash/view.dart';
import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


main() async {
  await dotenv.load(fileName: '.env'); // load env
  AppComponent.init(); // init dependency
  await _initFabric(); // init

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runZonedGuarded<Future<void>>(() async {
      runApp(MyApp()); // run app
    }, FirebaseCrashlytics.instance.recordError);
  });
}

Future<void> _initFabric() async {
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kReleaseMode);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

void _initLogger() {
  // Logger.root.level = Level.ALL;
  // Logger.root.info("Logger initialized.");
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final CustomRouter.Router _router;
  static bool isConnectedToInternet = false;
  final _navigatorKey = GlobalKey<NavigatorState>();
  final FirebaseAnalyticsObserver _observer =
      AppComponent.getInjector().get<FirebaseAnalyticsObserver>();

  MyApp() : _router = CustomRouter.Router() {
    _initLogger(); // init logger
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('id'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver, _observer],
    );
  }
}

import 'dart:convert';

import 'package:clean_arc_flutter/app/infrastructure/TimeConverter.dart';
import 'package:clean_arc_flutter/app/infrastructure/encrypter.dart';
import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/app/infrastructure/persistences/api_service.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class RootModule {
  static void init(Injector injector) {
    injector.registerSingleton<Endpoints>(
        () => Endpoints(dotenv.env['BASE_URL'] ?? ""));
    injector.registerDependency<TimeConverter>(() => TimeConverter());
    injector
        .registerSingleton<UserData>(() => UserData(injector.get<Encrypter>()));
    injector
        .registerSingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

    injector.registerDependency<Dio>(() {
      var dio = Dio();
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;

      var userData = injector.get<UserData>();
      var endpoints = injector.get<Endpoints>();

      // use for log response and request data
      if (kDebugMode) {
        dio.interceptors.add(LogInterceptor(
            requestBody: true,
            responseBody: true,
            requestHeader: true,
            responseHeader: false,
            request: true));
      }
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor);
      var tokenCheck = userData.token?.isNotEmpty ?? false;
      var token = userData.token ?? "";
      if (userData.token != null && tokenCheck)
        dio.options.headers["Authorization"] = "Bearer " + token;
      dio.options.baseUrl = endpoints.baseUrl;

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      return dio;
    });

    injector.registerSingleton<EventBus>(() {
      return EventBus();
    });

    injector.registerDependency<ApiService>(() {
      return ApiService(injector.get<Dio>(), injector.get<EventBus>());
    });


    injector.registerSingleton<FirebaseAnalytics>(() {
      return FirebaseAnalytics();
    });

    injector.registerSingleton<FirebaseAnalyticsObserver>(() {
      return FirebaseAnalyticsObserver(
          analytics: injector.get<FirebaseAnalytics>());
    });

    injector.registerDependency<Encrypter>(() {
      return Encrypter();
    });
  }

  static parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}

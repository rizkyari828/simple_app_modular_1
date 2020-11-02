import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/mid/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/home/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/login/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/login/presenter.dart';
import 'package:clean_arc_flutter/app/ui/pages/profilenew/presenter.dart';
import 'package:clean_arc_flutter/app/ui/pages/main/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/profile/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/profilenew/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/splash/controller.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<SplashController>((Injector injector) {
      return SplashController(injector.getDependency<UserData>());
    });
    injector.registerDependency<MainController>((Injector injector) {
      return MainController(injector.getDependency<UserData>());
    });
    injector.registerDependency<ProfileNewController>((Injector injector) {
      return ProfileNewController(
        injector.getDependency<UserData>(),
        injector.getDependency<ProfileNewPresenter>(),
      );
    });
    injector.registerDependency<HomeController>((Injector injector) {
      return HomeController(injector.getDependency<UserData>());
    });
    injector.registerDependency<MidController>((Injector injector) {
      return MidController(injector.getDependency<UserData>());
    });
    injector.registerDependency<ProfileController>((Injector injector) {
      return ProfileController(injector.getDependency<UserData>());
    });
    injector.registerDependency<LoginController>((Injector injector) {
      return LoginController(injector.getDependency<LoginPresenter>(),
          injector.getDependency<UserData>());
    });
  }
}

import 'package:clean_arc_flutter/app/ui/pages/login/presenter.dart';
import 'package:clean_arc_flutter/use_cases/auth/login.dart';
import 'package:injector/injector.dart';
// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {
    
    injector.registerDependency<LoginPresenter>((Injector injector) {
      return LoginPresenter(injector.getDependency<LoginUseCase>());
    });
  }
}

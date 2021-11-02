import 'package:modular_1/app/ui/pages/login/presenter.dart';
import 'package:modular_1/use_cases/auth/login.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<LoginPresenter>(() {
      return LoginPresenter(injector.get<LoginUseCase>());
    });
  }
}

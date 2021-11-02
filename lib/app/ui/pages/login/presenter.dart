import 'package:modular_1/data/payload/contracts/auth_request.dart';
import 'package:modular_1/domains/entities/user.dart';
import 'package:modular_1/use_cases/auth/login.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  late LoginUseCase _usecase;

  late Function loginOnNext;
  late Function loginOnComplete;
  late Function loginOnError;

  LoginPresenter(LoginUseCase usecase) {
    _usecase = usecase;
  }

  void onLogin(LoginRequestInterface request) {
    _usecase.execute(_LoginObserver(this), request);
  }

  void dispose() {
    _usecase.dispose();
  }
}

class _LoginObserver implements Observer<User> {
  LoginPresenter _presenter;

  _LoginObserver(this._presenter);

  void onNext(User? auth) {
    _presenter.loginOnNext(auth);
  }

  void onComplete() {
    _presenter.loginOnComplete();
  }

  void onError(e) {
    _presenter.loginOnError(e);
  }
}

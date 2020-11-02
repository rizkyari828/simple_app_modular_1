import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:clean_arc_flutter/use_cases/auth/login.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  LoginUseCase _usecase;

  Function loginOnNext;
  Function loginOnComplete;
  Function loginOnError;

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
  
  void onNext(User auth) {
    _presenter.loginOnNext(auth);
  }

  void onComplete() {
    _presenter.loginOnComplete();
  }

  void onError(e) {
    _presenter.loginOnError(e);
  }
}
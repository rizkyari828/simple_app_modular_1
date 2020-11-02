import 'package:clean_arc_flutter/domains/entities/profile.dart';
import 'package:clean_arc_flutter/use_cases/profile/profile.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileNewPresenter extends Presenter {
  ProfileUseCase _usecase;

  Function loadOnNext;
  Function loadOnComplete;
  Function loadOnError;

  ProfileNewPresenter(ProfileUseCase usecase) {
    _usecase = usecase;
  }

  void onLoad() {
    _usecase.execute(_ProfileObserver(this));
  }

  void dispose() {
    _usecase.dispose();
  }
}

class _ProfileObserver implements Observer<ProfileNew> {
  ProfileNewPresenter _presenter;

  _ProfileObserver(this._presenter);
  
  void onNext(ProfileNew profile) {
    _presenter.loadOnNext(profile);
  }

  void onComplete() {
    _presenter.loadOnComplete();
  }

  void onError(e) {
    _presenter.loadOnError(e);
  }
}
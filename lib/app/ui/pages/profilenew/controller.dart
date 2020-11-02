import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/domains/entities/profile.dart';
import 'package:clean_arc_flutter/app/ui/pages/profilenew/presenter.dart';

class ProfileNewController extends BaseController {
  UserData _sp;
  UserData get sp => _sp;
  ProfileNewPresenter _presenter;

  ProfileNewController(
    this._sp,
    this._presenter,
  ) : super() {
    initListeners();
    load();
  }

  @override
  void initListeners() {
    super.initListeners();
    _presenter.loadOnNext = (ProfileNew profile) async {
      _sp.fromProfileNew(profile);
      await _sp.save();
      print("Masuk on load");
    };
    _presenter.loadOnComplete = () {};
    _presenter.loadOnError = (e) {
      print("Masuk erorr");
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInternetConnected() {
    super.onInternetConnected();
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }

  void load() {
    print("Masuk load");
    _presenter.onLoad();
  }
}

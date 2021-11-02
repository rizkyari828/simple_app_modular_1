// import 'package:flushbar/flushbar.dart';

import 'package:modular_1/app/infrastructure/contract/base_controller.dart';
import 'package:modular_1/app/misc/user_data.dart';

class ProfileController extends BaseController {
  UserData _sp;

  UserData get sp => _sp;

  ProfileController(this._sp) : super() {
    // setupFlushbar();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInternetConnected() {
    super.onInternetConnected();
    // kFlushbar..show(getContext());
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }
}

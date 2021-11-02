import 'package:modular_1/app/infrastructure/contract/base_controller.dart';
import 'package:modular_1/app/misc/user_data.dart';

class MainController extends BaseController {
  UserData _sp;
  int? _tabIndex;

  int? get tabIndex => _tabIndex;
  UserData get sp => _sp;

  MainController(this._sp) : super() {
    _tabIndex = 0;
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
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }

  void changeTab(i) {
    this._tabIndex = i;
    refreshUI();
  }
}

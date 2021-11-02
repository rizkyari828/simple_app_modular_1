import 'package:modular_1/app/infrastructure/contract/base_controller.dart';
import 'package:modular_1/app/misc/user_data.dart';
import 'package:modular_1/app/ui/pages/login/presenter.dart';
import 'package:modular_1/app/ui/pages/pages.dart';
import 'package:modular_1/data/payload/api/auth/login_api_payload.dart';
import 'package:modular_1/domains/entities/user.dart';
import 'package:flutter/widgets.dart';

class LoginController extends BaseController {
  LoginPresenter _presenter;
  late User _auth;
  UserData _userData;
  bool loading = false;

  bool _isErrorEmployeeCode = false, _isObscured = true;

  TextEditingController _employeeInput = new TextEditingController();
  TextEditingController _passwordInput = new TextEditingController();

  TextEditingController get employeeNumberInput => _employeeInput;
  TextEditingController get passwordInput => _passwordInput;
  ErrorMessage _errorMessage = new ErrorMessage();
  User? get auth => _auth;
  ErrorMessage get errorMessage => _errorMessage;
  bool get isErrorEmployeeCode => _isErrorEmployeeCode;
  bool get isObscured => _isObscured;

  LoginController(this._presenter, this._userData) : super() {
    _auth = User();
    _passwordInput.addListener(_onInputChange);
  }

  void login() {
    showLoading();
    refreshUI();
    _presenter.onLogin(LoginApiRequest(
        username: _employeeInput.text, password: _passwordInput.text));
  }

  bool isAllFilled() {
    return _employeeInput.text.isNotEmpty ? true : false;
  }

  @override
  void initListeners() {
    super.initListeners();

    _presenter.loginOnNext = (User auth) {
      _auth = auth;
      refreshUI();
    };

    _presenter.loginOnComplete = () async {
      _userData.fromUser(_auth);
      _userData.password = _passwordInput.text;
      await _userData.save();

      print("Data User auth ${_auth.profile?.name}");
      print("Data User sp ${_userData.name}");

      dismissLoading();
      Navigator.pushReplacementNamed(getContext(), Pages.main);
    };

    _presenter.loginOnError = (e) {
      // do log here
    };
  }

  void toggleVisibility() {
    _isObscured = !_isObscured;
    refreshUI();
  }

  void _onInputChange() {
    //_isError = _EmployeeCodeInput.text != "49494" ? true : false;
    //_errorMessage = _EmployeeCodeInput.text != "49494" ? 'Error: kode Employee tidak valid ' : null;
    _errorMessage.employeecode =
        _employeeInput.text.length < 3 ? 'Kode Employee tidak valid ' : '';
  }
}

class ErrorMessage {
  String employeecode = '';
  bool isValid() {
    return employeecode.isEmpty ? true : false;
  }
}

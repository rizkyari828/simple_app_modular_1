import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/ui/pages/login/controller.dart';
import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:clean_arc_flutter/app/ui/widgets/button.dart';
import 'package:clean_arc_flutter/app/ui/widgets/loading.dart';
import 'package:clean_arc_flutter/app/ui/widgets/text_input.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class LoginPage extends View {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState(
      AppComponent.getInjector().getDependency<LoginController>());
}

class _LoginPageState extends ViewState<LoginPage, LoginController>
    with WidgetsBindingObserver {
  _LoginPageState(LoginController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget buildPage() {
    return new Scaffold(
      key: globalKey,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('lib/app/ui/assets/images/Lancong.png'),
              ),
              height: 162,
              width: 162,
            ),
            Container(
              child: CommonTextInput(
                isDense: true,
                isError:
                    controller.errorMessage.employeecode?.isNotEmpty ?? false,
                errorText: controller.errorMessage.employeecode,
                controller: controller.employeeNumberInput,
                placeholder: S.of(context).input_placeholder_employee,
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
              child: CommonTextInput(
                isPassword: true,
                isDense: true,
                textObscured: controller.isObscured,
                onVisibilityPressed: () {
                  controller.toggleVisibility();
                },
                isError: false,
                controller: controller.passwordInput,
                placeholder: S.of(context).input_placeholder_password,
                prefixIcon: Icon(
                  Icons.vpn_key,
                  size: 30,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              child: CommonButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 48,
                isDisabled: false,
                buttonText: controller.isLoading
                    ? CommonLoading()
                    : S.of(context).label_enter.toUpperCase(),
                onPressed: () {
                  _onLoginButtonPressed();
                },
              ),
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    print("data kirim nama ${controller.employeeNumberInput.text}, Password ${controller.passwordInput.text}");
    controller.login();
  }
}

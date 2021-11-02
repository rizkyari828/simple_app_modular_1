import 'package:modular_1/app/infrastructure/app_component.dart';
import 'package:modular_1/app/ui/pages/profile/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class ProfilePage extends View {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => new _ProfilePageState(
      AppComponent.getInjector().get<ProfileController>());
}

class _ProfilePageState extends ViewState<ProfilePage, ProfileController>
    with WidgetsBindingObserver {
  _ProfilePageState(ProfileController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget get view => ControlledWidgetBuilder<ProfileController>(
        builder: (context, controller) => new Scaffold(
          key: globalKey,
          body: Text("Cek bisa gak "),
        ),
      );
}

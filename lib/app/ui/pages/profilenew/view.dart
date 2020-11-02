import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/ui/pages/profilenew/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class ProfilenewPage extends View {
  ProfilenewPage({Key key}) : super(key: key);

  @override
  _ProfilenewPageState createState() => new _ProfilenewPageState(
      AppComponent.getInjector().getDependency<ProfileNewController>());
}

class _ProfilenewPageState extends ViewState<ProfilenewPage, ProfileNewController>
    with WidgetsBindingObserver {
  _ProfilenewPageState(ProfileNewController controller) : super(controller);

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
    return new Scaffold(key: globalKey, appBar:  AppBar(
        title: Text('Profilenew'),
      ),body: Text("Cek bisa gak ${controller.sp.nama}"));
  }
}

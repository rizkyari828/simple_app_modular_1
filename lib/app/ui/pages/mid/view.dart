import 'package:modular_1/app/infrastructure/app_component.dart';
import 'package:modular_1/app/ui/pages/mid/controller.dart';
import 'package:modular_1/app/ui/widgets/rto_widget.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class MidPage extends View {
  MidPage({Key? key}) : super(key: key);

  @override
  _MidPageState createState() =>
      new _MidPageState(AppComponent.getInjector().get<MidController>());
}

class _MidPageState extends ViewState<MidPage, MidController>
    with WidgetsBindingObserver {
  _MidPageState(MidController controller) : super(controller);

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
  Widget get view => ControlledWidgetBuilder<MidController>(
        builder: (context, controller) => new Scaffold(
          key: globalKey,
          body: RtoWidget(
            onPressed: () {
              controller.checkInternetConnection();
            },
          ),
        ),
      );
}

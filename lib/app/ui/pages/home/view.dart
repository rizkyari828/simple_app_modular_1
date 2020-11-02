import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/ui/pages/home/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends View {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState(
      AppComponent.getInjector().getDependency<HomeController>());
}

class _HomePageState extends ViewState<HomePage, HomeController>
    with WidgetsBindingObserver {
  _HomePageState(HomeController controller) : super(controller);

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Button 1'),
              onPressed: () {
                Navigator.pushNamed(context, Pages.profile);
              },
            ),
          ],
        ));
  }
}

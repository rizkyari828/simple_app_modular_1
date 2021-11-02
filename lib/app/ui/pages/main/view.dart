import 'package:modular_1/app/infrastructure/app_component.dart';
import 'package:modular_1/app/misc/constants.dart';
import 'package:modular_1/app/ui/pages/mid/view.dart';
import 'package:modular_1/app/ui/pages/home/view.dart';
import 'package:modular_1/app/ui/pages/main/controller.dart';
import 'package:modular_1/app/ui/pages/profile/view.dart';
import 'package:modular_1/app/ui/res/generated/i18n.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class MainPage extends View {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() =>
      new _MainPageState(AppComponent.getInjector().get<MainController>());
}

class _MainPageState extends ViewState<MainPage, MainController>
    with WidgetsBindingObserver {
  MainController _controller;
  _MainPageState(this._controller) : super(_controller);

  AppLifecycleState? _state;

  List<Widget> pages = [
    new HomePage(),
    new MidPage(),
    new ProfilePage(),
  ];

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
  Widget get view => ControlledWidgetBuilder<MainController>(
        builder: (context, controller) => Scaffold(
          key: globalKey,
          body: pages[controller.tabIndex ?? 0],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30,
            backgroundColor: AppConstants.COLOR_WHITE,
            selectedItemColor: AppConstants.COLOR_PRIMARY_COLOR,
            unselectedItemColor: Colors.grey,
            items: [
              new BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage('lib/app/ui/assets/icons/attend.png'),
                  size: 30,
                ),
                title: new Text(S.of(context)?.home_bar ?? ""),
              ),
              new BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage('lib/app/ui/assets/icons/attend.png'),
                  size: 30,
                ),
                title: new Text(S.of(context)?.tourism ?? ""),
              ),
              new BottomNavigationBarItem(
                icon: new ImageIcon(
                  AssetImage('lib/app/ui/assets/icons/attend.png'),
                  size: 30,
                ),
                title: new Text(S.of(context)?.profile_bar ?? ""),
              ),
            ],
            currentIndex: controller.tabIndex ?? 0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.changeTab(index);
            },
          ),
        ),
      );
}

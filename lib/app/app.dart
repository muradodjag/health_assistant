import 'package:device_preview/device_preview.dart';
import 'package:expert_system/router/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


final navigatorKey = GlobalKey<NavigatorState>();
class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);
  static final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MaterialApp(
          navigatorKey: navigatorKey,
              useInheritedMediaQuery: true,
              builder: DevicePreview.appBuilder,
              routes: mainNavigation.routes,
              initialRoute: MainNavigationRouteNames.loaderWidget,
            ));
  }
}

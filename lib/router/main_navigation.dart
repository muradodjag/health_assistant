import 'package:expert_system/domain/factories/screen_factory.dart';
import 'package:flutter/cupertino.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const auth = '/auth';
  static const registration = '/registration';
}

class MainNavigation {
  static final _screenfactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenfactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenfactory.makeAuth(),
    MainNavigationRouteNames.registration: (_) =>
        _screenfactory.makeRegistration()
  };

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}

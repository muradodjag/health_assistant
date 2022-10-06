import 'package:flutter/material.dart';

class LoaderViewModel {
  final BuildContext context;
//   final _authService = AuthService();

  LoaderViewModel(this.context) {
//     asyncInit();
  }

//   Future<void> asyncInit() async {
//     await checkAuth();
//   }

//   Future<void> checkAuth() async {
//     await Future.delayed(Duration(seconds: 1));
//     final isAuth = await _authService.isAuth();

//     final isOnline =
//         await (Connectivity().checkConnectivity()) == ConnectivityResult.none
//             ? false
//             : true;
//     var nextScreen = MainNavigationRouteNames.auth;

//     /*if (!isOnline) {
//       nextScreen = MainNavigationRouteNames.noInternetPage;
//     } else if (isAuth) {
//       nextScreen = MainNavigationRouteNames.mainScreen;
//     }*/

//     Navigator.of(context).pushReplacementNamed(nextScreen);
//   }
}

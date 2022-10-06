import 'package:expert_system/screens/loader/loader_viewmodel.dart';
import 'package:expert_system/screens/loader/loader_widget.dart';
import 'package:expert_system/screens/login/login_screen.dart';
import 'package:expert_system/screens/login/login_viewmodel.dart';
import 'package:expert_system/screens/registration/registration_screen.dart';
import 'package:expert_system/screens/registration/registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
        create: (context) => LoaderViewModel(context),
        child: const LoaderWidget(),
        lazy: false);
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
        create: (_) => AuthViewModel(), child: const AuthScreen());
  }

  Widget makeRegistration() {
    return ChangeNotifierProvider(
        create: (_) => RegistrationViewModel(),
        child: const RegistrationScreen());
  }
}

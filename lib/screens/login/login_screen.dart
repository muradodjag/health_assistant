import 'package:expert_system/animation/FadeAnimation.dart';
import 'package:expert_system/app/app.dart';
import 'package:expert_system/screens/icons/my_flutter_app_icons.dart';
import 'package:expert_system/screens/login/login_viewmodel.dart';
import 'package:expert_system/router/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthViewModel>();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                        child: SvgPicture.asset('assets/images/logo_c.svg')),
                    Expanded(
                        child: Image.asset(
                      'assets/images/logo_holding.png',
                      height: 40,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "AI Health Assistant",
                          style:
                              TextStyle(color: Color(0xff5D5DFF), fontSize: 30),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff5D5DFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              1.4,
                              Column(
                                children: <Widget>[
                                  TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      /*onChanged: (value) {
                                    model.changeEmailError();
                                  },*/
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        /* errorText: model.errorEmail
                                        ? null
                                        : model.errorMap['email'],*/
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Pasha Id',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      controller: passController,
                                      //onChanged: (_) => model.changePwdError(),
                                      obscureText: !model.passVisibility,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        errorStyle:
                                            TextStyle(color: Colors.red),
                                        /*errorText: model.errorPwd
                                            ? null
                                            : model.errorMap['password'],*/
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        hintText: 'Password',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            model.passVisibility
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color(0xff5D5DFF),
                                          ),
                                          onPressed: model.changeVisibility,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      )),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                              1.6,
                              Center(
                                  child: ElevatedButton(
                                onPressed: /*model.canStartAuth
                                          ? () => model.auth(context)*/
                                    signIn,
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * 0.6,
                                        40),
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Color(0xff5D5DFF)),
                                ),
                                /*child: model.isAuthProgress
                                          ? const SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            )
                                          : Text(
                                              LocaleKeys.login_login_btn.tr()*/
                              ))),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1.5,
                          ),
                          FadeAnimation(
                              1.7,
                              Center(
                                  child: ElevatedButton.icon(
                                icon: Icon(Icons.phone_iphone_rounded),
                                label: Text(
                                  'Continue with phone number',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: /*model.canStartAuth
                                          ? () => model.auth(context)*/
                                    () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromHeight(40),
                                    primary: Color(0xff5D5DFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.5)),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),

                                /*child: model.isAuthProgress
                                          ? const SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            )
                                          : Text(
                                              LocaleKeys.login_login_btn.tr()*/
                              ))),
                          SizedBox(
                            height: 5,
                          ),
                          FadeAnimation(
                              1.7,
                              Center(
                                  child: ElevatedButton.icon(
                                icon: Icon(MyFlutterApp.pasha_logo),
                                label: Text(
                                  'Continue with PASHA Bank app',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: /*model.canStartAuth
                                          ? () => model.auth(context)*/
                                    () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromHeight(40),
                                    primary: Color(0xff5D5DFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: Colors.white, width: 1.5)),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),

                                /*child: model.isAuthProgress
                                          ? const SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            )
                                          : Text(
                                              LocaleKeys.login_login_btn.tr()*/
                              ))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          FadeAnimation(
                              1.7,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed(MainNavigationRouteNames
                                              .registration),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                  // bottomLeft
                                                  offset: Offset(-1.5, -1.5),
                                                  color: Colors.black),
                                              Shadow(
                                                  // bottomRight
                                                  offset: Offset(1.5, -1.5),
                                                  color: Colors.black),
                                              Shadow(
                                                  // topRight
                                                  offset: Offset(1.5, 1.5),
                                                  color: Colors.black),
                                              Shadow(
                                                  // topLeft
                                                  offset: Offset(-1.5, 1.5),
                                                  color: Colors.black),
                                            ]),
                                      ))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Color(0xff5D5DFF),
              ),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

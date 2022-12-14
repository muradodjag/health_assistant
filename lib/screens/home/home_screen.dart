import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
        onPressed: () => FirebaseAuth.instance.signOut(),
        child: Text('Sign out'),
      )),
    );
  }
}

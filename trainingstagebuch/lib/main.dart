import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainingstagebuch/screens/wrapper.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: Wrapper(),
        ),
        color: Colors.white,
      ),
    );
  }
}

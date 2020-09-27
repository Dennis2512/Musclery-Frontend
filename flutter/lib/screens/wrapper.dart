import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainingstagebuch/screens/home.dart';
import 'package:trainingstagebuch/screens/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    // return either Home or Login, depending on AuthState
    return user == null ? Login() : Home();
  }
}

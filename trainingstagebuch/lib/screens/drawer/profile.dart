import 'package:flutter/material.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService auth = AuthService();
  String text = "Hello";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
        ),
        body: Center(
          child: Text("Profil"),
        ),
      ),
    );
  }
}

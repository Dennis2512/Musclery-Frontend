import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        autovalidate: false,
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logo_sport.png"),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
              textInputAction: TextInputAction.next,
              validator: (input) =>
                  input.contains('@') ? null : "Invalid email.",
              onChanged: (input) => setState(() => this._email = input),
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Passwort",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
              validator: (input) =>
                  input.length >= 6 ? null : "Invalid Password.",
              onChanged: (input) => {setState(() => this._password = input)},
              onFieldSubmitted: (_) => _login(),
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              color: Colors.blue,
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              child: MaterialButton(
                height: 60,
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                onPressed: () => {FocusScope.of(context).unfocus(), _login()},
                child: loading
                    ? SpinKitCircle(
                        color: Colors.black,
                        size: 30,
                      )
                    : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (this._formkey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      AuthResult res = await this._auth.signIn(this._email, this._password);
      if (res == null) {
        setState(() {
          this.loading = false;
        });
        this._formkey.currentState.reset();
        this._email = "";
        this._password = "";
        FocusScope.of(context).previousFocus();
      }
    }
  }
}

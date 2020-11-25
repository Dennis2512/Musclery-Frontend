import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/screens/register.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _loginformkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool loading = false;
  bool login = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _loginformkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logo_weiß.jpeg"),
              height: 300,
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
              onFieldSubmitted: (_) => login ? _login() : _register(),
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
                onPressed: () => {
                  FocusScope.of(context).unfocus(),
                  login ? _login() : _register()
                },
                child: loading
                    ? SpinKitCircle(
                        color: Colors.black,
                        size: 30,
                      )
                    : Text(
                        login ? "Login" : "Registrieren",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text(
                login ? "Registrieren" : "Login",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => setState(() => {login = !login}),
            )
          ],
        ),
      ),
    ));
  }

  void _login() async {
    if (this._loginformkey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      AuthResult res = await this._auth.signIn(this._email, this._password);
      if (res == null) {
        setState(() {
          this.loading = false;
        });
        this._loginformkey.currentState.reset();
        this._email = "";
        this._password = "";
        FocusScope.of(context).previousFocus();
      }
    }
  }

  void _register() async {
    if (this._loginformkey.currentState.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Register(
                    email: _email,
                    password: _password,
                  )));
    }
  }
}

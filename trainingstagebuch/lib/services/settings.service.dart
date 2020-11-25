import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/user.model.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class SettingsService {
  AuthService _auth = AuthService();

  Future<User> fetchUserData() async {
    try {
      final String token = await _auth.getToken();
      http.Response res = await http.get(
          "https://europe-west3-muclery6669.cloudfunctions.net/settings",
          headers: {"authorization": "Bearer " + token});
      if (res.statusCode == 200) {
        return User.fromJson(json.decode(res.body));
      } else {
        print(res.body);
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<bool> updateUser(User user) async {
    final String token = await _auth.getToken();
    final String userString = json.encode(user.toJson());
    http.Response res = await http.post(
        "https://europe-west3-muclery6669.cloudfunctions.net/settings",
        headers: {"authorization": "Bearer " + token},
        body: {"user": userString});
    if (res.statusCode == 200) {
      return true;
    } else {
      print(res.body);
      return false;
    }
  }

  Future<bool> register(String email, String password, User user) async {
    bool success = await _auth.register(email, password);
    if (success) {
      return await updateUser(user);
    } else {
      return false;
    }
  }
}

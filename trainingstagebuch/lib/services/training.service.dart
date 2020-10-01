import 'dart:convert';

import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/services/auth.service.dart';
import 'package:http/http.dart' as http;

class TrainingService {
  AuthService _auth = AuthService();
  List<Training> trainings = [];

  Future<void> fetchTrainings() async {
    try {
      final token = await _auth.getToken();
      var res = await http.get(
          "https://europe-west3-muclery6669.cloudfunctions.net/training",
          headers: {"authorization": "Bearer " + token});
      if (res.statusCode == 200) {
        dynamic data = json.decode(res.body);
        data.forEach((doc) => {trainings.add(Training.fromJson(doc))});
      } else {
        print(res.body);
      }
    } catch (err) {
      print(err);
    }
  }
}

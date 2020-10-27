import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/screens/sport/trainingDetails.dart';
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

  List<Widget> getContent(BuildContext context) {
    List<Widget> list = [];
    trainings.forEach((training) {
      list.add(DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(training.name),
          subtitle: Text(training.date.toString()),
          trailing: Icon(Icons.edit),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TrainingsDetails(
                        training: training,
                      ))),
        ),
      ));
      list.add(SizedBox(
        height: 10,
      ));
    });
    return list;
  }

  createNewTraining() async {
    final token = await _auth.getToken();
    final res = await http.post(
        "https://europe-west3-muclery6669.cloudfunctions.net/training",
        headers: {"authorization": "Bearer " + token},
        body: {});
    if (res.statusCode == 200) {
      dynamic data = json.decode(res.body);
      trainings.add(Training.fromJson(data));
    } else {
      print(res.body);
    }
  }
}

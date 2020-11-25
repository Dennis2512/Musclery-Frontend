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
      final String token = await _auth.getToken();
      http.Response res = await http.get(
          "https://europe-west3-muclery6669.cloudfunctions.net/training",
          headers: {"authorization": "Bearer " + token});
      if (res.statusCode == 200) {
        trainings = [];
        dynamic data = json.decode(res.body);
        data.forEach((doc) => {trainings.add(Training.fromJson(doc))});
      } else {
        print(res.body);
      }
    } catch (err) {
      print(err);
    }
  }

  List<Widget> getContent(BuildContext context, Function callback) {
    List<Widget> list = [];
    trainings.forEach((training) {
      list.add(DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(training.name),
          subtitle: Text(training.date.day.toString() +
              "." +
              training.date.month.toString() +
              "." +
              training.date.year.toString()),
          trailing: Icon(Icons.edit),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TrainingsDetails(
                        training: training.copy(),
                        callback: callback,
                      ))),
          onLongPress: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                    title: Text(training.name),
                    contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey[100]))),
                        child: ListTile(
                          title: Text("Eintrag löschen"),
                          leading: Icon(Icons.delete),
                          onTap: () => {
                            deleteTraining(training, callback),
                            Navigator.pop(context)
                          },
                        ),
                      )
                    ],
                  )),
        ),
      ));
      list.add(SizedBox(
        height: 10,
      ));
    });
    return list;
  }

  Future<Training> createNewTraining() async {
    final String token = await _auth.getToken();
    http.Response res = await http.post(
        "https://europe-west3-muclery6669.cloudfunctions.net/training",
        headers: {"authorization": "Bearer " + token},
        body: {});
    if (res.statusCode == 200) {
      dynamic data = json.decode(res.body);
      Training train = Training.fromJson(data);
      return train;
    } else {
      print(res.body);
      return null;
    }
  }

  Future<void> updateTraining(Training t) async {
    final String token = await _auth.getToken();
    final String trainingString = json.encode(t.toJson());
    http.Response res = await http.post(
        "https://europe-west3-muclery6669.cloudfunctions.net/training",
        headers: {"authorization": "Bearer " + token},
        body: {"training": trainingString});
    if (res.statusCode != 200) {
      print(res.body);
    }
  }

  Future<void> deleteTraining(Training t, Function callback) async {
    final String token = await _auth.getToken();
    http.Response res = await http.delete(
      "https://europe-west3-muclery6669.cloudfunctions.net/training",
      headers: {"authorization": "Bearer " + token, "id": t.id},
    );
    if (res.statusCode == 200) {
      await callback();
    } else {
      print(res.body);
    }
  }
}

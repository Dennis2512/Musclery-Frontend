import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';
import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/screens/sport/exerciseDetails.dart';

class ExerciseService {
  List<Exercise> exercises;

  Future<void> fetchExercises() async {
    try {
      exercises = [];
      var res = await http
          .get("https://europe-west3-muclery6669.cloudfunctions.net/exercises");
      if (res.statusCode == 200) {
        final dynamic js = json.decode(res.body);
        js.forEach((element) {
          exercises.add(Exercise.fromJson(element));
        });
      } else {
        print(res.body);
      }
    } catch (err) {
      print(err);
    }
  }

  List<Widget> getExerciseTiles(context, Training training, dynamic callback) {
    List<Widget> list = [];
    exercises.forEach((element) {
      list.add(ListTile(
        title: Text(element.name),
        subtitle: Text(element.beschreibung),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseDetails(
                  exercise: element,
                  training: training,
                  updateCallback: callback,
                ),
              ))
        },
      ));
      list.add(Divider());
    });
    return list;
  }
}

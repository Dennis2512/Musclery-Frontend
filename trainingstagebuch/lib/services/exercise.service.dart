import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';
import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/screens/sport/exerciseDetails.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class ExerciseService {
  List<Exercise> exercises;

  Future<void> fetchExercises() async {
    try {
      exercises = [];
      http.Response res = await http
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

  List<Widget> getExerciseTiles(context, Training training, dynamic callback,
      String regex, List<String> regexcat) {
    List<Widget> list = [];
    List<Exercise> filtered =
        (regexcat.length > 0) ? filterByCategory(regexcat) : exercises;
    filtered = (regex != null && regex.length > 0 && filtered.length > 0)
        ? filter(regex, filtered)
        : filtered;
    filtered.forEach((element) {
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

  List<Exercise> filter(String filter, List<Exercise> list) {
    List<Exercise> filtered = [];
    list.forEach((exercise) {
      if (exercise.name.toLowerCase().contains(filter.toLowerCase()) ||
          exercise.beschreibung.toLowerCase().contains(filter.toLowerCase())) {
        filtered.add(exercise);
      }
    });
    return filtered;
  }

  List<Exercise> filterByCategory(List<String> categories) {
    List<Exercise> filtered = [];
    exercises.forEach((exercise) {
      if (categories
          .any((element) => exercise.muskelgruppen.contains(element))) {
        filtered.add(exercise);
      }
    });
    return filtered;
  }

  Future<String> addExercise(Exercise exercise) async {
    try {
      final AuthService _auth = AuthService();
      final String token = await _auth.getToken();
      http.Response res = await http.post(
          "https://europe-west3-muclery6669.cloudfunctions.net/exercises",
          headers: {"authorization": "Bearer " + token},
          body: {"exercise": json.encode(exercise.toJson())});

      if (res.statusCode == 200) {
        return res.body;
      } else {
        print(res.body);
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}

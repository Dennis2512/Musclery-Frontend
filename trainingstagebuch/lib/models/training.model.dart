import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';

class Training {
  String id, name, beschreibung, notes;
  DateTime date;
  List<Exercise> exercises;
  Training(
      {this.id,
      this.name,
      this.beschreibung,
      this.date,
      this.notes,
      this.exercises});
  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['data']['name'],
        date = transformDate(json['data']["date"]),
        beschreibung = json['data']['beschreibung'],
        notes = json['data']["notes"],
        exercises = transformExercises(json['data']['exercises']);
  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "date": date.toString(),
        "beschreibung": beschreibung,
        "notes": notes,
        "exercises": exercises
      };

  static transformDate(dynamic date) {
    return new Timestamp(date['_seconds'], date['_nanoseconds']).toDate();
  }

  static transformExercises(dynamic exs) {
    List<Exercise> res = [];
    exs.forEach((exer) {
      res.add(Exercise.fromJson(exer));
    });
    return res;
  }

  Training copy() {
    List<Exercise> excopy = [];
    exercises.forEach((element) {
      excopy.add(element.copy());
    });
    return new Training(
        id: id,
        beschreibung: beschreibung,
        date: date,
        exercises: excopy,
        name: name,
        notes: notes);
  }
}

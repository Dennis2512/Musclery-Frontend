import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';

class ExerciseDetails extends StatelessWidget {
  final Exercise exercise;
  ExerciseDetails({this.exercise});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(title: Text(exercise.name)),
          Divider(color: Colors.grey),
          ListTile(title: Text(exercise.beschreibung)),
          Divider(
            color: Colors.grey,
          ),
          Wrap(
            children: getChips(),
            alignment: WrapAlignment.start,
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  List<Widget> getChips() {
    List<Widget> list = [];
    exercise.muskelgruppen.forEach((element) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(Chip(label: Text(element)));
    });
    return list;
  }
}

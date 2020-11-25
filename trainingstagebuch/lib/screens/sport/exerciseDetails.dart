import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/services/training.service.dart';

class ExerciseDetails extends StatefulWidget {
  final Exercise exercise;
  final Training training;
  final updateCallback;
  final TrainingService ts = TrainingService();
  ExerciseDetails({this.exercise, this.training, this.updateCallback});
  @override
  _ExerciseDetailsState createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        actions: [
          loading
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                )
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () => save(),
                ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(title: Text(widget.exercise.name)),
          Divider(color: Colors.grey),
          ListTile(title: Text(widget.exercise.beschreibung)),
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
    widget.exercise.muskelgruppen.forEach((element) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(Chip(label: Text(element)));
    });
    return list;
  }

  void save() async {
    widget.updateCallback(widget.exercise);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}

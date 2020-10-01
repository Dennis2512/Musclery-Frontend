import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/services/training.service.dart';

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  TrainingService ts = TrainingService();
  Widget content = SpinKitThreeBounce(
    color: Colors.blue,
  );
  @override
  void initState() {
    initTraining();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: content,
    );
  }

  initTraining() async {
    await ts.fetchTrainings();
    setState(() {
      content = Text(ts.trainings.length.toString());
    });
  }
}

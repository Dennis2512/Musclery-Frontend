import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/screens/sport/createTraining.dart';
import 'package:trainingstagebuch/screens/sport/trainingDetails.dart';
import 'package:trainingstagebuch/services/training.service.dart';

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  TrainingService ts = TrainingService();
  Widget content = Center(
    heightFactor: 14,
    child: SpinKitThreeBounce(
      color: Colors.blue,
    ),
  );
  @override
  void initState() {
    initTraining();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: content,
      ),
    );
  }

  initTraining() async {
    await ts.fetchTrainings();
    setState(() {
      content = Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: ListTile(
                  title: Text("Neues Training hinzufügen"),
                  leading: Icon(Icons.add),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrainingsDetails())),
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(children: ts.getContent(context)),
          )
        ],
      );
    });
  }
}

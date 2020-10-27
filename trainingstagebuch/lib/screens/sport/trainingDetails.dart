import 'package:flutter/material.dart';
import 'package:trainingstagebuch/screens/sport/exerciseAdder.dart';

class TrainingsDetails extends StatefulWidget {
  @override
  _TrainingsDetailsState createState() => _TrainingsDetailsState();
}

class _TrainingsDetailsState extends State<TrainingsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Trainings Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              children: [
                DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Übung hinzufügen"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseAdder(
                              title: "Übung hinzufügen",
                              day: null,
                              updateCallback: null,
                            ),
                          )),
                    ))
              ],
            )),
      ),
    );
  }
}

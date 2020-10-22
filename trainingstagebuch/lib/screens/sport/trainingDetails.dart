import 'package:flutter/material.dart';

class TrainingsDetails extends StatefulWidget {
  @override
  _TrainingsDetailsState createState() => _TrainingsDetailsState();
}

class _TrainingsDetailsState extends State<TrainingsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text("This is the detail Screen")),
      ),
    );
  }
}

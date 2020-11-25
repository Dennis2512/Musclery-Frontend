import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/training.model.dart';

class CreateTraining extends StatefulWidget {
  @override
  _CreateTrainingState createState() => _CreateTrainingState();
}

class _CreateTrainingState extends State<CreateTraining> {
  final _trainingformkey = GlobalKey<FormState>();
  Training training = new Training(
      name: "Training",
      date: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      notes: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Training hinzufügen"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _trainingformkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: "Name",
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    textInputAction: TextInputAction.next,
                    initialValue: training.name,
                    validator: (value) =>
                        value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onChanged: (value) => setState(() => training.name = value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: null,
                    color: Colors.blue,
                    child: Text(training.date.toString()),
                  ),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: "Description",
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

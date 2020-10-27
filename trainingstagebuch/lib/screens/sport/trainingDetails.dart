import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/screens/sport/exerciseAdder.dart';

class TrainingsDetails extends StatefulWidget {
  final Training training;
  TrainingsDetails({this.training});

  @override
  _TrainingsDetailsState createState() => _TrainingsDetailsState();
}

class _TrainingsDetailsState extends State<TrainingsDetails> {
  final _formkey = GlobalKey<FormState>();
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
        actions: [
          IconButton(icon: Icon(Icons.done), onPressed: () => check()),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formkey,
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
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        textInputAction: TextInputAction.next,
                        initialValue: widget.training.name,
                        validator: (value) => value.length > 0
                            ? null
                            : "Dies ist ein Pflichtfeld!",
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) =>
                            setState(() => widget.training.name = value),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                            labelText: "Beschreibung",
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        textInputAction: TextInputAction.next,
                        initialValue: widget.training.beschreibung,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (value) => setState(
                            () => widget.training.beschreibung = value),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                            labelText: "Datum",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => showDatePicker(
                                        context: context,
                                        initialDate: widget.training.date,
                                        firstDate: DateTime(1900),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1))
                                    .then((value) => {
                                          if (value != null)
                                            {
                                              setState(() => {
                                                    widget.training.date = value
                                                  })
                                            }
                                        })),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        textInputAction: TextInputAction.next,
                        controller: TextEditingController(text: formatDate()),
                        readOnly: true,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
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

  check() {
    if (_formkey.currentState.validate()) {
      print("valid");
    } else {
      print("invalid");
    }
  }

  String formatDate() {
    return widget.training.date.day.toString() +
        "." +
        widget.training.date.month.toString() +
        "." +
        widget.training.date.year.toString();
  }
}

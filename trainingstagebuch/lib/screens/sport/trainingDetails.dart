import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/screens/sport/exerciseAdder.dart';
import 'package:trainingstagebuch/services/training.service.dart';
import 'package:trainingstagebuch/models/set.model.dart';

class TrainingsDetails extends StatefulWidget {
  final Training training;
  final callback;
  TrainingsDetails({this.training, this.callback});

  @override
  _TrainingsDetailsState createState() => _TrainingsDetailsState();
}

class _TrainingsDetailsState extends State<TrainingsDetails> {
  final _formkey = GlobalKey<FormState>();
  final TrainingService ts = TrainingService();
  bool loading = false;
  List<Widget> content;
  @override
  Widget build(BuildContext context) {
    content = exerciseContent();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Trainings Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Text("Bearbeitung abbrechen"),
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text(
                      "Ungespeicherte Änderungen können verloren gehen. Trotzdem fortfahren?"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Abbrechen",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Text(
                          "Verlassen",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () =>
                            {Navigator.pop(context), Navigator.pop(context)},
                      )
                    ],
                  )
                ],
              ),
            )
          },
        ),
        actions: [
          loading
              ? SpinKitThreeBounce(size: 20, color: Colors.white)
              : IconButton(
                  onPressed: () => check(),
                  icon: Icon(Icons.done),
                ),
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
                              updateCallback: update,
                              training: widget.training,
                            ),
                          )),
                    )),
                Column(
                  children: content,
                )
              ],
            )),
      ),
    );
  }

  check() async {
    setState(() {
      loading = true;
    });
    if (_formkey.currentState.validate()) {
      await ts.updateTraining(widget.training);
      await this.widget.callback();
      Navigator.pop(context);
    }
  }

  update(Exercise e) {
    setState(() {}); // just to update screen
  }

  String formatDate() {
    return widget.training.date.day.toString() +
        "." +
        widget.training.date.month.toString() +
        "." +
        widget.training.date.year.toString();
  }

  List<Widget> exerciseContent() {
    List<Widget> list = [
      SizedBox(
        height: 20,
      )
    ];
    widget.training.exercises.forEach((element) {
      // name
      list.add(DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ListTile(
          title: Text(element.name),
        ),
      ));
      // liste der sätze
      int number = 0;
      element.sets.forEach((setelement) {
        number++;
        list.add(DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[100]))),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Satz " + number.toString() + ":"),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 40,
                    height: 30,
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 17)),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(
                          text: setelement.gewicht.toString()),
                      onChanged: (value) => setState(() => {
                            setelement.gewicht = int.parse(value),
                          }),
                    )),
                Text("kg"),
                SizedBox(
                  width: 15,
                ),
                Text("Reps:"),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey[600]),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(minWidth: 0),
                  onPressed: () => setState(() => {
                        setelement.reps = setelement.reps - 1,
                      }),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 17)),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller:
                        TextEditingController(text: setelement.reps.toString()),
                    onChanged: (value) => setState(() => {
                          setelement.reps = int.parse(value),
                        }),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey[600]),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(minWidth: 0),
                  onPressed: () => setState(() => {
                        setelement.reps = setelement.reps + 1,
                      }),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey),
                  onPressed: () =>
                      setState(() => {element.sets.remove(setelement)}),
                )
              ],
            ),
          ),
        ));
      });
      // satz hinzufügen
      list.add(InkWell(
        onTap: () => {
          setState(() => {element.sets.add(new Set(gewicht: 0, reps: 0))})
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.add, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  "Satz hinzufügen",
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                )
              ],
            ),
          ),
        ),
      ));
      // abstand
      list.add(SizedBox(
        height: 20,
      ));
    });
    return list;
  }
}

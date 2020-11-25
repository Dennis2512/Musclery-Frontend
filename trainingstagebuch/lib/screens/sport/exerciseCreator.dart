import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/exercise.model.dart';

class ExerciseCreator extends StatefulWidget {
  final exerciseAdderCallback;
  ExerciseCreator({this.exerciseAdderCallback});
  @override
  _ExerciseCreatorState createState() => _ExerciseCreatorState();
}

class _ExerciseCreatorState extends State<ExerciseCreator> {
  Exercise exercise =
      new Exercise(name: "", beschreibung: "", muskelgruppen: [], sets: []);
  final _exerciseformkey = GlobalKey<FormState>();
  List<Widget> chips;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    chips = getChips();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Übung erstellen"),
        actions: [
          loading
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                )
              : IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => validate(),
                ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _exerciseformkey,
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
                  validator: (value) =>
                      value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                  onChanged: (value) => setState(() => exercise.name = value),
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
                  validator: (value) =>
                      value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                  onChanged: (value) =>
                      setState(() => exercise.beschreibung = value),
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Kategorien"),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: getChips(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  validate() {
    FocusScope.of(context).unfocus();
    setState(() {
      loading = true;
    });
    if (_exerciseformkey.currentState.validate()) {
      widget.exerciseAdderCallback(exercise);
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  List<Widget> getChips() {
    List<String> labels = [
      "Brust",
      "Bizeps",
      "Beine",
      "Trizeps",
      "Schultern",
      "Nacken",
      "Rücken",
      "Po",
      "Bauch",
      "Unterkörper",
      "Oberkörper"
    ];
    List<Widget> list = [];
    labels.forEach((label) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(InkWell(
        child: Chip(
            label: exercise.muskelgruppen.contains(label)
                ? Wrap(
                    children: [
                      Icon(Icons.done),
                      SizedBox(
                        width: 5,
                      ),
                      Text(label)
                    ],
                    crossAxisAlignment: WrapCrossAlignment.center,
                  )
                : Text(label),
            backgroundColor: exercise.muskelgruppen.contains(label)
                ? Colors.blue
                : Colors.grey[400]),
        onTap: () => setState(() => {
              exercise.muskelgruppen.contains(label)
                  ? exercise.muskelgruppen.remove(label)
                  : exercise.muskelgruppen.add(label),
              chips = getChips()
            }),
      ));
    });
    return list;
  }
}

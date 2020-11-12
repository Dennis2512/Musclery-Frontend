import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/recommendations.model.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  final List<Recommendation> recommendationsList = [
    Recommendation("Leg Press", "Strength", 3, 15, ["Quadriceps Muscle"],
        "assets/legpress.png"),
    Recommendation(
        "Pushups",
        "Strength",
        3,
        15,
        ["Breast Muscle", "Shoulder Muscle", "Triceps Muscle"],
        "assets/pushups.png"),
    Recommendation("Treadmill", "Endurance", 3, 5,
        ["Heart Muscle", "Fibula Muscle"], "assets/running.png"),
    Recommendation("Shoulder Press", "Strength", 3, 5, ["Shoulder Muscle"],
        "assets/schulter.png"),
  ];
  var stringMuscleList = "";

  List<String> musclesToFilterOn = [
    "Fibula Muscle",
    "Quadriceps Muscle",
    "Shoulder Muscle",
    "Breast Muscle",
    "Heart Muscle",
    "Biceps Muscle",
    "Triceps Muscle",
    "Back Muscle",
    "Stomach Muscle"
  ];

  List<String> selectedMuscleList = List();
  final _scrollController = ScrollController();

  _showFilterDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Filter by Muscle", textAlign: TextAlign.center),
            content: Container(
              constraints: BoxConstraints(
                minHeight: 200.0,
                maxHeight: 300.0,
                minWidth: 150.0,
                maxWidth: 300.0,
              ),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: MultiSelectChip(
                    musclesToFilterOn,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedMuscleList = selectedList;
                      });
                    },
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text("Filter"),
                  onPressed: () {
                    setState(() {
                      print(selectedMuscleList);
                    });
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Featured"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        _showFilterDialog();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 300,
                              minHeight: 30,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Filter by Muscles",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            new Expanded(
              child: ListView.builder(
                  itemCount: recommendationsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildRecommendationsCard(context, index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecommendationsCard(BuildContext context, int index) {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: [
          new Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 3.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: Image(
                              image: AssetImage(
                                  recommendationsList[index].imageUrl),
                              width: 50,
                              height: 50,
                              color: Colors.blue),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        //SizedBox(
                        //  width: 300,
                        Expanded(
                          child: Text(
                              recommendationsList[index].trainingExerciseTitle,
                              style: new TextStyle(
                                  fontSize: 30, color: Colors.blue)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          //   width: 150,
                          child: Text("Training Type:",
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                          //   width: 150,
                          child: Text(
                              recommendationsList[index].trainingExerciseType,
                              textAlign: TextAlign.right,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          // width: 150,
                          child: Text("Sets: ",
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                          // width: 150,
                          child: Text(
                              recommendationsList[index]
                                  .numberOfSets
                                  .toString(),
                              textAlign: TextAlign.right,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        if ((recommendationsList[index]
                                .trainingExerciseType
                                .compareTo("Endurance")) ==
                            0)
                          Expanded(
                            // width: 150,
                            child: Text("Minutes:",
                                style: new TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                        if ((recommendationsList[index]
                                .trainingExerciseType
                                .compareTo("Strength")) ==
                            0)
                          Expanded(
                            // width: 150,
                            child: Text("Repetitions:",
                                style: new TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                        Expanded(
                          // width: 150,
                          child: Text(
                              recommendationsList[index]
                                  .numberOfRepetitionsOrDuration
                                  .toString(),
                              textAlign: TextAlign.right,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Muscle:",
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                          child: Text(
                              stringMuscleList = Recommendation.getMuscleList(
                                  recommendationsList[index].muscle),
                              textAlign: TextAlign.right,
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> musclesToFilterOn;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.musclesToFilterOn, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.musclesToFilterOn.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          showCheckmark: true,
          checkmarkColor: Colors.white,
          label: Text(
            item,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          selectedColor: Colors.blueAccent,
          backgroundColor: Colors.blue[100],
          shadowColor: Colors.blue[100],
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

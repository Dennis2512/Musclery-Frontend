import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/recommendations.model.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  final List<Recommendation> recommendationsList = [
    Recommendation(
        "Beinpresse", "Kraft", 3, 15, ["Beine"], "assets/legpress.png"),
    Recommendation("Liegestütz", "Kraft", 3, 15,
        ["Brust", "Schulter", "Trizeps"], "assets/pushups.png"),
    Recommendation(
        "Joggen", "Ausdauer", 3, 5, ["Herz", "Lunge"], "assets/running.png"),
    Recommendation(
        "Schulterdrücken", "Kraft", 3, 5, ["Schultern"], "assets/schulter.png"),
  ];
  String stringMuscleList = "";

  List<String> selectedMuscleList = List();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Übungsvorschläge"),
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
            Expanded(
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
                          child: Text("Trainingsart:",
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
                          child: Text("Sätze: ",
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
                                .compareTo("Ausdauer")) ==
                            0)
                          Expanded(
                            // width: 150,
                            child: Text("Minuten:",
                                style: new TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                        if ((recommendationsList[index]
                                .trainingExerciseType
                                .compareTo("Kraft")) ==
                            0)
                          Expanded(
                            // width: 150,
                            child: Text("Wiederholungen:",
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
                          child: Text("Muskelgruppen:",
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

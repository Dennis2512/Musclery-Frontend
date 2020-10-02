import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/recommendations.model.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  final List<Recommendation> recommendationsList = [
    Recommendation(
        "Leg Press", "Strength", 3, 15, "Leg Biceps", "assets/legpress.png"),
    Recommendation(
        "Pushups", "Strength", 3, 15, "Breast", "assets/pushups.png"),
    Recommendation(
        "Treadmill", "Endurance", 3, 5, "Heart Mucle", "assets/running.png")
  ];
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
        body: new ListView.builder(
            itemCount: recommendationsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildRecommendationsCard(context, index)),
      ),
    );
  }

  Widget buildRecommendationsCard(BuildContext context, int index) {
    return new Container(
      color: Colors.white,
      child: Card(
        color: Color.fromRGBO(1, 225, 233, 100),
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
                          image:
                              AssetImage(recommendationsList[index].imageUrl),
                          width: 50,
                          height: 50,
                          color: Colors.blue),
                    ),

                    //   Spacer(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Text(
                          recommendationsList[index].trainingExerciseTitle,
                          style:
                              new TextStyle(fontSize: 30, color: Colors.black)),
                    ),

                    //   Spacer(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Text("Training Type:",
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                    ),

                    //  Spacer(flex: 3),
                    SizedBox(
                      width: 150,
                      child: Text(
                          recommendationsList[index].trainingExerciseType,
                          textAlign: TextAlign.right,
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                    ),

                    // Spacer(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Text("Sets: ",
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                    ),

                    //   Spacer(flex: 3),
                    SizedBox(
                      width: 150,
                      child: Text(
                          recommendationsList[index].numberOfSets.toString(),
                          textAlign: TextAlign.right,
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                    ),

                    //    Spacer(),
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
                      SizedBox(
                        width: 150,
                        child: Text("Minutes:",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white)),
                      ),
                    if ((recommendationsList[index]
                            .trainingExerciseType
                            .compareTo("Strength")) ==
                        0)
                      SizedBox(
                        width: 150,
                        child: Text("Repetitions:",
                            style: new TextStyle(
                                fontSize: 15, color: Colors.white)),
                        //    Spacer(flex: 3),
                      ),
                    SizedBox(
                      width: 150,
                      child: Text(
                          recommendationsList[index]
                              .numberOfRepetitionsOrDuration
                              .toString(),
                          textAlign: TextAlign.right,
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                      //     Spacer(),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Text("Muscle:",
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                      //   Spacer(flex: 3),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(recommendationsList[index].muscle,
                          textAlign: TextAlign.right,
                          style:
                              new TextStyle(fontSize: 15, color: Colors.white)),
                      //     Spacer(),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

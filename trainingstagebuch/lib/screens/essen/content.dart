import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/screens/essen/calories.dart';
import 'package:trainingstagebuch/screens/essen/meal.dart';
import 'package:trainingstagebuch/screens/essen/notes.dart';
import 'package:trainingstagebuch/screens/essen/nutritions.dart';

class Content extends StatefulWidget {
  final Day day;
  final updateCallback;
  Content({this.day, this.updateCallback});
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Calories(
        day: widget.day,
      ),
      SizedBox(
        height: 10,
      ),
      Meal(
        day: widget.day,
        meal: widget.day.breakfast,
        title: "Frühstück",
        updateCallback: update,
      ),
      SizedBox(
        height: 10,
      ),
      Meal(
        day: widget.day,
        meal: widget.day.lunch,
        title: "Mittagessen",
        updateCallback: update,
      ),
      SizedBox(
        height: 10,
      ),
      Meal(
        day: widget.day,
        meal: widget.day.dinner,
        title: "Abendessen",
        updateCallback: update,
      ),
      SizedBox(
        height: 40,
      ),
      Row(
        children: [
          SizedBox(
            width: 150,
            height: 50,
            child: RaisedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nutritions(
                        day: widget.day,
                      ),
                    ))
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.pie_chart),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Nährwerte")
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: RaisedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notes(
                        day: widget.day,
                      ),
                    ))
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.note_add),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Notizen")
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      SizedBox(
        height: 20,
      )
    ]));
  }

  update() {
    widget.updateCallback();
  }
}

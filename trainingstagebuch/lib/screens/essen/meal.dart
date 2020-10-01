import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/screens/essen/details.dart';
import 'package:trainingstagebuch/screens/essen/foodAdder.dart';

class Meal extends StatefulWidget {
  final List<Food> meal;
  final Day day;
  final String title;
  final updateCallback;
  Meal({this.day, this.meal, this.title, this.updateCallback});
  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  final SimpleDialog dia = SimpleDialog(
    title: Text("Tagebuch"),
    contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    children: [
      DecoratedBox(
        child: ListTile(
          title: Text("Eintrag löschen"),
          leading: Icon(Icons.delete),
          onTap: () => {},
        ),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[100]))),
      ),
      DecoratedBox(
        child: ListTile(
          title: Text("Eintrag verschieben"),
          leading: Icon(Icons.compare_arrows),
        ),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[100]))),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> foodwidgets = getFoodTiles();
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                    child: Text(
                  widget.day.sumMeal(widget.meal).toString(),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.end,
                )),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
        Column(
          children: foodwidgets,
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodAdder(
                        title: widget.title,
                        day: widget.day,
                        updateCallback: update,
                      ))),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Nahrungsmittel hinzufügen",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  update() {
    widget.updateCallback();
  }

  updateFood(Food element, Food updatedElement) {
    setState(() {
      widget.day.updateFoodInMeal(widget.title, element, updatedElement);
    });
    update();
    Navigator.pop(context);
  }

  List<Widget> getFoodTiles() {
    List<Widget> list = [];
    widget.meal.forEach((element) {
      list.add(DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey[100]))),
        child: ListTile(
          title: Text(element.name),
          subtitle: Text(element.description +
              ", " +
              element.amount.toString() +
              " " +
              element.unit.name),
          trailing: Text(element.getCalories().toString()),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    food: Food.fromJson(
                        json.decode(json.encode(element.toJson()))),
                    origin: element,
                    mealCallback: updateFood,
                    title: "Eintrag bearbeiten",
                  ),
                ))
          },
          onLongPress: () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: Text(element.name),
              contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              children: [
                DecoratedBox(
                  child: ListTile(
                    title: Text("Eintrag löschen"),
                    leading: Icon(Icons.delete),
                    onTap: () => {
                      widget.day.removeFoodfromMeal(element, widget.title),
                      update(),
                      Navigator.pop(context)
                    },
                  ),
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[100]))),
                ),
                DecoratedBox(
                  child: ListTile(
                    title: Text("Eintrag verschieben"),
                    leading: Icon(Icons.compare_arrows),
                    onTap: () => {
                      Navigator.pop(context),
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: Text("Verschieben nach..."),
                          children: [
                            ListTile(
                              title: Text("Frühstück"),
                              onTap: () => {
                                widget.day.moveMeal(
                                    element, widget.title, "Frühstück"),
                                update(),
                                Navigator.pop(context)
                              },
                            ),
                            ListTile(
                              title: Text("Mittagessen"),
                              onTap: () => {
                                widget.day.moveMeal(
                                    element, widget.title, "Mittagessen"),
                                update(),
                                Navigator.pop(context)
                              },
                            ),
                            ListTile(
                              title: Text("Abendessen"),
                              onTap: () => {
                                widget.day.moveMeal(
                                    element, widget.title, "Abendessen"),
                                update(),
                                Navigator.pop(context)
                              },
                            )
                          ],
                          contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                        ),
                      )
                    },
                  ),
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[100]))),
                ),
              ],
            ),
          ),
        ),
      ));
    });
    return list;
  }
}

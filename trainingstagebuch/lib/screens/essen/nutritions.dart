import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/screens/essen/diagramme/mealcharts.dart';
import 'package:trainingstagebuch/screens/essen/diagramme/nutritioncharts.dart';
import 'package:trainingstagebuch/screens/essen/diagramme/progresscharts.dart';

class Nutritions extends StatefulWidget {
  final Day day;
  Nutritions({this.day});
  @override
  _NutritionsState createState() => _NutritionsState();
}

class _NutritionsState extends State<Nutritions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text("Nährwerte"),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Progresscharts(
                day: widget.day,
              ),
              SizedBox(
                height: 20,
              ),
              Nutritioncharts(
                day: widget.day,
              ),
              SizedBox(
                height: 20,
              ),
              Mealcharts(
                day: widget.day,
              )
            ],
          ),
        ),
      ),
    );
  }
}

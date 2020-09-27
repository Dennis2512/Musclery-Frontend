import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trainingstagebuch/models/day.model.dart';

class Progresscharts extends StatelessWidget {
  final Day day;
  Progresscharts({this.day});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Zielwerte",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                child: Text(
                  "Kalorien",
                  style: TextStyle(fontSize: 18),
                ),
                width: 110),
            LinearPercentIndicator(
              animation: true,
              percent: (day.current / day.goal.kcal) <= 1
                  ? (day.current / day.goal.kcal)
                  : 1,
              width: 180,
              lineHeight: 20,
              progressColor: Colors.yellow,
              center: Text(day.current.toStringAsFixed(0) +
                  "/" +
                  day.goal.kcal.toString()),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 50,
              child: Text(
                  (day.current / day.goal.kcal * 100).toStringAsFixed(1) + "%"),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                child: Text(
                  "Kohlenhydrate",
                  style: TextStyle(fontSize: 15),
                ),
                width: 110),
            LinearPercentIndicator(
              animation: true,
              percent: (day.getCarbs() / day.goal.carbs) <= 1
                  ? (day.getCarbs() / day.goal.carbs)
                  : 1,
              width: 180,
              lineHeight: 20,
              progressColor: Colors.blue,
              center: Text(day.getCarbs().toStringAsFixed(1) +
                  "/" +
                  day.goal.carbs.toString()),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 50,
              child: Text(
                  (day.getCarbs() / day.goal.carbs * 100).toStringAsFixed(1) +
                      "%"),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                child: Text(
                  "Proteine",
                  style: TextStyle(fontSize: 15),
                ),
                width: 110),
            LinearPercentIndicator(
              animation: true,
              percent: (day.getProteins() / day.goal.protein) <= 1
                  ? (day.getProteins() / day.goal.protein)
                  : 1,
              width: 180,
              lineHeight: 20,
              progressColor: Colors.green,
              center: Text(day.getProteins().toStringAsFixed(1) +
                  "/" +
                  day.goal.protein.toString()),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              child: Text((day.getProteins() / day.goal.protein * 100)
                      .toStringAsFixed(1) +
                  "%"),
              width: 50,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
                child: Text(
                  "Fette",
                  style: TextStyle(fontSize: 15),
                ),
                width: 110),
            LinearPercentIndicator(
              animation: true,
              percent: (day.getFats() / day.goal.fats) <= 1
                  ? (day.getFats() / day.goal.fats)
                  : 1,
              width: 180,
              lineHeight: 20,
              progressColor: Colors.red,
              center: Text(day.getFats().toStringAsFixed(1) +
                  "/" +
                  day.goal.fats.toString()),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              child: Text(
                  (day.getFats() / day.goal.fats * 100).toStringAsFixed(1) +
                      "%"),
              width: 50,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}

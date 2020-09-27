import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trainingstagebuch/models/day.model.dart';

class Mealcharts extends StatelessWidget {
  final Day day;
  Mealcharts({this.day});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                "Mahlzeiten",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          PieChart(
            dataMap: {
              "breakfast": day.sumMeal(day.breakfast).toDouble(),
              "lunch": day.sumMeal(day.lunch).toDouble(),
              "dinner": day.sumMeal(day.dinner).toDouble()
            },
            chartRadius: 150,
            chartType: ChartType.disc,
            colorList: [Colors.yellow, Colors.orange, Colors.red],
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                chartValueStyle: TextStyle(color: Colors.black)),
            legendOptions: LegendOptions(showLegends: false),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.yellow),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Frühstück"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.sumMeal(day.breakfast) /
                                (day.sumMeal(day.breakfast) +
                                    day.sumMeal(day.lunch) +
                                    day.sumMeal(day.dinner) +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.sumMeal(day.breakfast).toString() +
                        " kcal)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.orange),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Mittagessen"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.sumMeal(day.lunch) /
                                (day.sumMeal(day.breakfast) +
                                    day.sumMeal(day.lunch) +
                                    day.sumMeal(day.dinner) +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.sumMeal(day.lunch).toString() +
                        " kcal)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Abendessen"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.sumMeal(day.dinner) /
                                (day.sumMeal(day.breakfast) +
                                    day.sumMeal(day.lunch) +
                                    day.sumMeal(day.dinner) +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.sumMeal(day.dinner).toString() +
                        " kcal)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

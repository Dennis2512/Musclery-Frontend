import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trainingstagebuch/models/day.model.dart';

class Nutritioncharts extends StatelessWidget {
  final Day day;
  Nutritioncharts({this.day});
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
                "Nährwerte",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          PieChart(
            dataMap: {
              "carbs": day.getCarbs().toDouble(),
              "fats": day.getFats().toDouble(),
              "proteins": day.getProteins().toDouble()
            },
            chartRadius: 150,
            chartType: ChartType.disc,
            colorList: [Colors.blue, Colors.red, Colors.green],
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                chartValueStyle: TextStyle(color: Colors.white)),
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
                        decoration: BoxDecoration(color: Colors.blue),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Kohlenhydrate"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.getCarbs() /
                                (day.getCarbs() +
                                    day.getFats() +
                                    day.getProteins() +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.getCarbs().toStringAsFixed(1) +
                        " g)",
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
                        decoration: BoxDecoration(color: Colors.green),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Proteine"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.getProteins() /
                                (day.getCarbs() +
                                    day.getFats() +
                                    day.getProteins() +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.getProteins().toStringAsFixed(1) +
                        " g)",
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
                      Text("Fette"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (day.getFats() /
                                (day.getCarbs() +
                                    day.getFats() +
                                    day.getProteins() +
                                    1) *
                                100)
                            .round()
                            .toString() +
                        "% (" +
                        day.getFats().toStringAsFixed(1) +
                        " g)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
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

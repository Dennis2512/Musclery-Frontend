import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trainingstagebuch/services/analyse.service.dart';

class CaloriesLineChart extends StatelessWidget {
  final AnalyseService ans;
  CaloriesLineChart({this.ans});
  @override
  Widget build(BuildContext context) {
    final data = ans.getLineChartFoodData();
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
          child: Center(
              child: Column(
            children: [
              Text(
                "Kalorienüberschüsse / -defizite der letzten 7 Tage",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              SizedBox(
                  height: 170,
                  child: LineChart(LineChartData(
                    titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          getTitles: (value) => data['dates']
                              [int.parse(value.toStringAsFixed(0)) - 1],
                          showTitles: true,
                        ),
                        leftTitles:
                            SideTitles(showTitles: true, interval: 200)),
                    gridData: FlGridData(show: true, horizontalInterval: 200),
                    minY: -600,
                    maxY: 800,
                    lineBarsData: [
                      LineChartBarData(
                        spots: data['spots'],
                        colors: data['colors'],
                      ),
                    ],
                  )))
            ],
          ))),
    );
  }
}

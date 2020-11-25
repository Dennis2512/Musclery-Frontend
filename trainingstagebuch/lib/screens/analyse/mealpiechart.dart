import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trainingstagebuch/services/analyse.service.dart';

class MealPieChart extends StatefulWidget {
  final AnalyseService ans;
  MealPieChart({this.ans});
  @override
  _MealPieChartState createState() => _MealPieChartState();
}

class _MealPieChartState extends State<MealPieChart> {
  String pos = "Kalorien";
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
          child: Center(
              child: Column(
            children: [
              Text(
                "Durchschnittsnährwerte deiner Mahlzeiten",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              PieChart(
                  dataMap: widget.ans.getDataMapFor(pos),
                  chartRadius: 150,
                  chartType: ChartType.disc,
                  colorList: [Colors.yellow, Colors.orange, Colors.red],
                  chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      decimalPlaces: 0,
                      chartValueStyle: TextStyle(color: Colors.black))),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: "Kalorien",
                    groupValue: pos,
                    onChanged: (value) => setState(() => {pos = value}),
                  ),
                  Text("Kalorien"),
                  Radio(
                    value: "Kohlenhydrate",
                    groupValue: pos,
                    onChanged: (value) => setState(() => {pos = value}),
                  ),
                  Text("KH"),
                  Radio(
                    value: "Protein",
                    groupValue: pos,
                    onChanged: (value) => setState(() => {pos = value}),
                  ),
                  Text("Protein"),
                  Radio(
                    value: "Fette",
                    groupValue: pos,
                    onChanged: (value) => setState(() => {pos = value}),
                  ),
                  Text("Fette")
                ],
              )
            ],
          )),
        ));
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trainingstagebuch/services/analyse.service.dart';

class ExerciseProgress extends StatefulWidget {
  final AnalyseService ans;
  ExerciseProgress({this.ans});
  @override
  _ExerciseProgressState createState() => _ExerciseProgressState();
}

class _ExerciseProgressState extends State<ExerciseProgress> {
  String _value = "ztrln2BVCyVXExsKGnCP";
  @override
  Widget build(BuildContext context) {
    dynamic data = widget.ans.getLineChartTrainingData(_value);
    dynamic dropdata = widget.ans.getExercisesDropDown();
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
        child: Center(
          child: Column(
            children: [
              Text(
                "Fortschritt nach Übung",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Übung: "),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    items: dropdata,
                    onChanged: (value) => {
                      setState(() => {_value = value})
                    },
                    value: _value,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
                              SideTitles(showTitles: true, interval: 5.0)),
                      axisTitleData: FlAxisTitleData(
                          leftTitle: AxisTitle(
                        titleText: "in KG",
                        showTitle: true,
                      )),
                      lineBarsData: [
                        LineChartBarData(
                            colors: [Colors.blue], spots: data['spots'])
                      ])))
            ],
          ),
        ),
      ),
    );
  }
}

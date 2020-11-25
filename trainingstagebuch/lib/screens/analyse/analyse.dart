import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/screens/analyse/calorieslinechart.dart';
import 'package:trainingstagebuch/screens/analyse/exerciseProgress.dart';
import 'package:trainingstagebuch/screens/analyse/mealpiechart.dart';
import 'package:trainingstagebuch/screens/analyse/rankFood.dart';
import 'package:trainingstagebuch/services/analyse.service.dart';

class Analyse extends StatefulWidget {
  @override
  _AnalyseState createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  AnalyseService ans = AnalyseService();
  bool loading = true;
  Widget food_content, training_content;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    food_content = getFoodContent();
    training_content = getTrainingContent();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            DecoratedBox(
              child: TabBar(
                tabs: [Tab(text: "Essen"), Tab(text: "Training")],
                indicatorColor: Colors.white,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  loading
                      ? SpinKitThreeBounce(
                          color: Colors.blue,
                        )
                      : food_content,
                  loading
                      ? SpinKitThreeBounce(
                          color: Colors.blue,
                        )
                      : training_content
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  loadData() async {
    await ans.fetchData();
    if (this.mounted) setState(() => {loading = false});
  }

  Widget getFoodContent() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ans.fooddata == null || ans.fooddata.length == 0
                    ? Center(
                        child: SpinKitThreeBounce(
                        color: Colors.blue,
                      ))
                    : CaloriesLineChart(ans: ans),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MealPieChart(ans: ans),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: RankFood(ans: ans),
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget getTrainingContent() {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ans.trainingdata == null ||
                              ans.trainingdata.length == 0
                          ? Center(
                              child: SpinKitThreeBounce(
                              color: Colors.blue,
                            ))
                          : ExerciseProgress(ans: ans))
                ],
              ),
              SizedBox(height: 20),
            ],
          )),
    );
  }
}

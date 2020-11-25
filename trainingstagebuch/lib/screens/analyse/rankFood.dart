import 'package:flutter/material.dart';
import 'package:trainingstagebuch/services/analyse.service.dart';

class RankFood extends StatelessWidget {
  final AnalyseService ans;
  RankFood({this.ans});
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
                "Deine Lieblingsnahrungsmittel",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              DataTable(columns: [
                DataColumn(label: Text("Platz")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Menge"))
              ], rows: ans.getFoodRanking())
            ],
          ),
        ),
      ),
    );
  }
}

/*Table(
                children: [
                  TableRow(children: [
                    Text(
                      "Platz",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Menge",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                  TableRow(children: [
                    Text("1", textAlign: TextAlign.center),
                    Text("Brot", textAlign: TextAlign.center),
                    Text("400g", textAlign: TextAlign.center)
                  ],decoration: )
                ],
              ), */

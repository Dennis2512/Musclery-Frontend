import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/bmi.model.dart';
import 'package:trainingstagebuch/screens/drawer/settings.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final PersonalData data = PersonalData("187 cm", "87 kg", "25", "male", "23");
  String bmiValue = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            /*
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              */
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image(
                              image: AssetImage("assets/bodysize.png"),
                              width: 25,
                              height: 25,
                              color: Colors.blue[500],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Body Height:",
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              data.bodyHeight,
                              style: new TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(123, 100, 229, 100)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image(
                              image: AssetImage("assets/bodyweight.png"),
                              width: 25,
                              height: 25,
                              color: Colors.blue[500],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Body Weight:",
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              data.bodyWeight,
                              style: new TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(123, 100, 229, 100)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image(
                              image: AssetImage("assets/age.png"),
                              width: 25,
                              height: 25,
                              color: Colors.blue[500],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Age:",
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              data.age,
                              style: new TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(123, 100, 229, 100)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image(
                              image: AssetImage("assets/gender.png"),
                              width: 25,
                              height: 25,
                              color: Colors.blue[500],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Gender:",
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              data.gender,
                              style: new TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(123, 100, 229, 100)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: 150,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Settings()),
                                  );
                                },
                                color: Color.fromRGBO(8, 242, 207, 100),
                                textColor: Colors.white,
                                child: Text("Edit in Settings".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromRGBO(8, 242, 207, 100))),
                              )),
                          SizedBox(
                            width: 150,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Divider(
                        color: Color.fromRGBO(96, 63, 230, 100),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image(
                              image: AssetImage("assets/bmi.png"),
                              width: 25,
                              height: 25,
                              color: Colors.blue[500],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("BMI Value::",
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              bmiValue =
                                  PersonalData.calculateBmiValue(187, 90),
                              style: new TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(123, 100, 229, 100)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: Divider(
                        color: Color.fromRGBO(96, 63, 230, 100),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 1.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'BMI Table',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.blue[300]),
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text("Age",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                  DataColumn(
                                      label: Text("Man",
                                          style: TextStyle(fontSize: 14))),
                                  DataColumn(
                                      label: Text("Woman",
                                          style: TextStyle(fontSize: 14))),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text("19-24",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("25-29,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("24-28,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("25-34",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("26-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("25-29,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("35-44",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("27-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("26-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("45-54",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("27-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("26-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("55-64",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("27-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("26-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("Above 64",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("27-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                    DataCell(Text("26-30,9",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            /*
            ),
            */
          ),
        ),
      ),
    );
  }
}

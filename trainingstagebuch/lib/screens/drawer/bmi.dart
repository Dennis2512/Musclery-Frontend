import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/user.model.dart';
import 'package:trainingstagebuch/services/settings.service.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  String bmiValue = "";
  final SettingsService ss = SettingsService();
  User user;
  @override
  void initState() {
    loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          centerTitle: true,
        ),
        body: user == null
            ? Center(
                child: SpinKitThreeBounce(
                color: Colors.blue,
              ))
            : Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  child: Text("Größe:",
                                      style: new TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    user.groesse.toStringAsFixed(0),
                                    style: new TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  child: Text("Gewicht:",
                                      style: new TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    user.gewicht.toStringAsFixed(0),
                                    style: new TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  child: Text("Alter:",
                                      style: new TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    user.alter.toString(),
                                    style: new TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  child: Text("Geschlecht:",
                                      style: new TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    user.geschlecht,
                                    style: new TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Divider(
                              color: Color.fromRGBO(96, 63, 230, 100),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                  child: Text("Dein BMI Wert:",
                                      style: new TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    bmiValue,
                                    style: new TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16.0),
                            child: Divider(
                              color: Color.fromRGBO(96, 63, 230, 100),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 1.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'BMI Durchschnittswerte nach Altersklassen:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 1.0, bottom: 8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.blue[300]),
                                    child: DataTable(
                                      columns: [
                                        DataColumn(
                                            label: Text("Alter",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ))),
                                        DataColumn(
                                            label: Text("Männer",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        DataColumn(
                                            label: Text("Frauen",
                                                style:
                                                    TextStyle(fontSize: 14))),
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
                                          DataCell(Text("Über 64",
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

  loadUser() async {
    User tmp = await ss.fetchUserData();
    String tmpBmi = (tmp.gewicht / ((tmp.groesse / 100) * (tmp.groesse / 100)))
        .toStringAsFixed(2);
    setState(() => {user = tmp, bmiValue = tmpBmi});
  }
}

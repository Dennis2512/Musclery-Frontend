import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trainingstagebuch/models/goal.model.dart';
import 'package:trainingstagebuch/models/user.model.dart';
import 'package:trainingstagebuch/services/settings.service.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final SettingsService ss = SettingsService();
  final _profilformkey = GlobalKey<FormState>();
  User user;
  bool saving = false;
  String name, geschlecht;
  int alter, aktiv;
  double gewicht, groesse;
  Goal goal;
  @override
  void initState() {
    loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: Text("Bearbeitung verlassen"),
                  contentPadding: EdgeInsets.all(20),
                  children: [
                    Text(
                        "Ungespeicherte Änderungen können verloren gehen. Trotzdem fortfahren?"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            "Abbrechen",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          child: Text(
                            "Verlassen",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () =>
                              {Navigator.pop(context), Navigator.pop(context)},
                        )
                      ],
                    )
                  ],
                ),
              )
            },
          ),
          actions: [
            saving
                ? SpinKitThreeBounce(size: 20, color: Colors.white)
                : IconButton(
                    onPressed: () => save(),
                    icon: Icon(Icons.done),
                  ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: user == null
            ? SpinKitThreeBounce(
                color: Colors.blue,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Form(
                    key: _profilformkey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Name"),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: TextFormField(
                                  autofocus: false,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  textInputAction: TextInputAction.next,
                                  initialValue: name,
                                  onChanged: (value) =>
                                      setState(() => name = value),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Geschlecht
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.tag,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Geschlecht"),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: SizedBox(
                                    width: 250,
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: "Mann",
                                            groupValue: geschlecht,
                                            onChanged: (value) => setState(() =>
                                                {
                                                  geschlecht = value,
                                                  updateGoal()
                                                })),
                                        Text("Mann"),
                                        Radio(
                                            value: "Frau",
                                            activeColor: Colors.pink,
                                            groupValue: geschlecht,
                                            onChanged: (value) => setState(() =>
                                                {
                                                  geschlecht = value,
                                                  updateGoal()
                                                })),
                                        Text("Frau")
                                      ],
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Alter
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.face_rounded,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Alter"),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: SfSlider(
                                    value: alter.toDouble(),
                                    showLabels: true,
                                    min: 10.0,
                                    max: 99.0,
                                    stepSize: 1.0,
                                    showTooltip: true,
                                    thumbIcon: Center(
                                        child: Text(
                                      alter.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      textAlign: TextAlign.center,
                                    )),
                                    onChanged: (value) => setState(() =>
                                        {alter = value.toInt(), updateGoal()})),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Größe
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.straighten_rounded,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Größe"),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: SfSlider(
                                    value: groesse,
                                    showLabels: true,
                                    min: 130.0,
                                    max: 220.0,
                                    stepSize: 1.0,
                                    showTooltip: true,
                                    thumbIcon: Center(
                                        child: Text(
                                      groesse.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                      textAlign: TextAlign.center,
                                    )),
                                    onChanged: (value) => setState(
                                        () => {groesse = value, updateGoal()})),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Gewicht
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.pregnant_woman_rounded,
                                        color: Colors.grey[600],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("Gewicht"),
                                    ],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: SfSlider(
                                    value: gewicht,
                                    showLabels: true,
                                    min: 50.0,
                                    max: 200.0,
                                    stepSize: 1.0,
                                    showTooltip: true,
                                    thumbIcon: Center(
                                        child: Text(
                                      gewicht.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                      textAlign: TextAlign.center,
                                    )),
                                    onChanged: (value) => setState(
                                        () => {gewicht = value, updateGoal()})),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Berechnete Nährwerte pro Tag",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Kcal",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    controller: TextEditingController(
                                        text: goal.kcal.toString()),
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Kh.",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    controller: TextEditingController(
                                        text: goal.carbs.toString()),
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Proteine",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    controller: TextEditingController(
                                        text: goal.protein.toString()),
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Fette",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    controller: TextEditingController(
                                        text: goal.fats.toString()),
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          )
                        ],
                      ),
                    )),
              ));
  }

  void loadUser() async {
    User tmp = await ss.fetchUserData();
    setState(() {
      user = tmp;
      name = user.name;
      geschlecht = user.geschlecht;
      alter = user.alter;
      aktiv = user.aktiv;
      gewicht = user.gewicht;
      groesse = user.groesse;
      goal = user.goal;
    });
  }

  updateGoal() {
    if (geschlecht == "Mann") {
      double kcal = 66.47 + (13.7 * gewicht) + (5 * groesse) - (6.8 * alter);
      double kh = kcal * 0.55 * 0.24;
      double pro = kcal * 0.3 * 0.24;
      double fat = kcal * 0.15 * 0.11;
      setState(() => {
            goal.kcal = kcal.round(),
            goal.carbs = kh.round(),
            goal.protein = pro.round(),
            goal.fats = fat.round()
          });
    } else {
      dynamic kcal = 655.1 + (9.6 * gewicht) + (1.8 * groesse) - (4.7 * alter);
      double kh = kcal * 0.55 * 0.24;
      double pro = kcal * 0.3 * 0.24;
      double fat = kcal * 0.15 * 0.11;
      setState(() => {
            goal.kcal = kcal.round(),
            goal.carbs = kh.round(),
            goal.protein = pro.round(),
            goal.fats = fat.round()
          });
    }
  }

  save() async {
    setState(() {
      saving = true;
    });
    if (_profilformkey.currentState.validate()) {
      user.name = name;
      user.alter = alter;
      user.geschlecht = geschlecht;
      user.gewicht = gewicht;
      user.groesse = groesse;
      user.goal = goal;
      bool success = await ss.updateUser(user);
      if (success) {
        Navigator.pop(context);
      } else {
        setState(() => {saving = false});
        Fluttertoast.showToast(msg: "Speichern nicht erfolgreich.");
      }
    }
  }
}

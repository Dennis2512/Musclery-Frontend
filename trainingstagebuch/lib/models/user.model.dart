import 'package:trainingstagebuch/models/goal.model.dart';

class User {
  String name, geschlecht;
  int alter, aktiv;
  double gewicht, groesse;
  Goal goal;
  User(
      {this.name,
      this.geschlecht,
      this.alter,
      this.aktiv,
      this.gewicht,
      this.groesse,
      this.goal});
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        geschlecht = json['geschlecht'],
        alter = int.parse(json['alter'].toString()),
        aktiv = int.parse(json['aktiv'].toString()),
        gewicht = double.parse(json['gewicht'].toString()),
        groesse = double.parse(json['groesse'].toString()),
        goal = Goal.fromJson(json['goal']);

  Map<String, Object> toJson() => {
        "name": name,
        "geschlecht": geschlecht,
        "alter": alter,
        "aktiv": aktiv,
        "gewicht": gewicht,
        "groesse": groesse,
        "goal": goal
      };
}

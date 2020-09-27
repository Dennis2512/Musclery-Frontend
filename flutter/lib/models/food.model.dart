import 'package:trainingstagebuch/models/unit.mode.dart';

class Food {
  String name, description, id;
  List<String> categories;
  Unit unit;
  List<Unit> units;
  int calories;
  double carbs, fats, protein, amount;
  Food(
      {this.id,
      this.name,
      this.description,
      this.categories,
      this.unit,
      this.units,
      this.calories,
      this.carbs,
      this.fats,
      this.protein,
      this.amount});
  Food.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        categories = transformToStringList(json['categories']),
        unit = Unit.fromJson(json['unit']),
        units = transform(json['units']),
        calories = json['calories'].toInt(),
        carbs = json['carbs'].toDouble(),
        fats = json['fats'].toDouble(),
        protein = json['protein'].toDouble(),
        amount = json['amount'].toDouble();

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "categories": categories,
        "unit": unit,
        "units": units,
        "calories": calories,
        "carbs": carbs,
        "protein": protein,
        "fats": fats,
        "amount": amount
      };

  static List<Unit> transform(List list) {
    List<Unit> res = [];
    list.forEach((unit) {
      res.add(Unit.fromJson(unit));
    });
    return res;
  }

  static List<String> transformToStringList(List list) {
    List<String> res = [];
    list.forEach((category) {
      res.add(category);
    });
    return res;
  }

  Unit getUnitWithName(String name) {
    Unit res;
    units.forEach((unit) {
      if (unit.name == name) {
        res = unit;
      }
    });
    return res;
  }

  int getCalories() {
    return (calories * unit.factor * (amount / 100)).round();
  }

  double getCarbs() {
    return (carbs * unit.factor * (amount / 100));
  }

  double getFats() {
    return (fats * unit.factor * (amount / 100));
  }

  double getProteins() {
    return (protein * unit.factor * (amount / 100));
  }
}

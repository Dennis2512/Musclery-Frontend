class Goal {
  int kcal, carbs, fats, protein;
  Goal({this.kcal, this.carbs, this.fats, this.protein});
  Goal.fromJson(Map<String, dynamic> json)
      : kcal = json['kcal'].toInt(),
        carbs = json['carbs'].toInt(),
        fats = json['fats'].toInt(),
        protein = json['protein'].toInt();
  Map<String, Object> toJson() =>
      {"kcal": kcal, "carbs": carbs, "fats": fats, "protein": protein};
}

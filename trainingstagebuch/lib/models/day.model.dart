import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/models/goal.model.dart';

class Day {
  String id, date, notes;
  int current;
  Goal goal;
  List<Food> breakfast, lunch, dinner;
  Day(
      {this.date,
      this.notes,
      this.goal,
      this.current,
      this.breakfast,
      this.lunch,
      this.dinner,
      this.id});
  Day.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['data']['date'],
        notes = json['data']['notes'],
        goal = transformGoal(json['data']['goal']),
        current = json['data']['current'],
        breakfast = transform(json['data']['breakfast']),
        lunch = transform(json['data']['lunch']),
        dinner = transform(json['data']['dinner']);

  Map<String, Object> toJson() => {
        "id": id,
        "date": date,
        "notes": notes,
        "goal": goal.toJson(),
        "current": current,
        "breakfast": breakfast,
        "lunch": lunch,
        "dinner": dinner
      };

  static List<Food> transform(List list) {
    List<Food> res = [];
    list.forEach((food) {
      res.add(Food.fromJson(food));
    });
    return res;
  }

  static Goal transformGoal(obj) {
    return Goal.fromJson(obj);
  }

  int getRest() {
    return goal.kcal - current;
  }

  int sumMeal(List<Food> meal) {
    int sum = 0;
    meal.forEach((food) {
      sum += food.getCalories();
    });
    return sum;
  }

  void setNotes(String notes) {
    this.notes = notes;
  }

  void addFoodtoMeal(Food food, String mealName) {
    getMealFromName(mealName).add(food);
    updateCurrent();
  }

  void removeFoodfromMeal(Food food, String mealName) {
    getMealFromName(mealName).remove(food);
    updateCurrent();
  }

  void moveMeal(Food food, String from, String to) {
    if (from != to) {
      removeFoodfromMeal(food, from);
      addFoodtoMeal(food, to);
    }
  }

  List<Food> getMealFromName(String name) {
    switch (name) {
      case "Frühstück":
        return breakfast;
        break;
      case "Mittagessen":
        return lunch;
        break;
      case "Abendessen":
        return dinner;
        break;
      default:
        return null;
    }
  }

  void updateFoodInMeal(String mealName, Food old, Food food) {
    getMealFromName(mealName)[getMealFromName(mealName).indexOf(old)] = food;
    updateCurrent();
  }

  void updateCurrent() {
    current = 0;
    breakfast.forEach((food) {
      current += food.getCalories();
    });
    lunch.forEach((food) {
      current += food.getCalories();
    });
    dinner.forEach((food) {
      current += food.getCalories();
    });
  }

  double getCarbs() {
    double carbs = 0;
    breakfast.forEach((food) {
      carbs += food.getCarbs();
    });
    lunch.forEach((food) {
      carbs += food.getCarbs();
    });
    dinner.forEach((food) {
      carbs += food.getCarbs();
    });
    return carbs;
  }

  double getFats() {
    double fats = 0;
    breakfast.forEach((food) {
      fats += food.getFats();
    });
    lunch.forEach((food) {
      fats += food.getFats();
    });
    dinner.forEach((food) {
      fats += food.getFats();
    });
    return fats;
  }

  double getProteins() {
    double proteins = 0;
    breakfast.forEach((food) {
      proteins += food.getProteins();
    });
    lunch.forEach((food) {
      proteins += food.getProteins();
    });
    dinner.forEach((food) {
      proteins += food.getProteins();
    });
    return proteins;
  }
}

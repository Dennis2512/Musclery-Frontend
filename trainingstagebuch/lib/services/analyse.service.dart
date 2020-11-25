import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/services/auth.service.dart';
import 'package:http/http.dart' as http;

class AnalyseService {
  AuthService _auth = AuthService();
  List<Day> fooddata;
  List<Training> trainingdata;

  Future<bool> fetchData() async {
    final String token = await _auth.getToken();
    try {
      http.Response res = await http.get(
          "https://europe-west3-muclery6669.cloudfunctions.net/analyse",
          headers: {
            "authorization": "Bearer " + token,
          });
      if (res.statusCode == 200) {
        dynamic data = json.decode(res.body);
        formatFood(data['food']);
        formatTraining(data['training']);
        return true;
      } else {
        print(res.body);
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }

  // training exercises list

  List<DropdownMenuItem> getExercisesDropDown() {
    List<DropdownMenuItem<String>> menu = [];
    List<String> ids = [];
    List<String> names = [];
    if (trainingdata.length > 0) {
      trainingdata.forEach((training) {
        training.exercises.forEach((exercise) {
          if (!ids.contains(exercise.id)) {
            ids.add(exercise.id);
            names.add(exercise.name);
          }
        });
      });
      ids.forEach((id) {
        menu.add(
            DropdownMenuItem(child: Text(names[ids.indexOf(id)]), value: id));
      });
    }

    return menu;
  }

  // training line chart data

  dynamic getLineChartTrainingData(String id) {
    List<FlSpot> spots = [];
    List<String> dates = [];
    if (trainingdata.length > 0) {
      trainingdata.forEach((training) {
        training.exercises.forEach((exercise) {
          if (exercise.id == id && exercise.sets.length > 0) {
            spots.add(new FlSpot((spots.length + 1).toDouble(),
                exercise.sets[0].gewicht.toDouble()));
            dates.add(training.date.day.toString() +
                "." +
                training.date.month.toString());
          }
        });
      });
    }

    return {"spots": spots, "dates": dates};
  }

  // data table rows

  List<DataRow> getFoodRanking() {
    List<DataRow> res = [];
    List<Food> foods = [];
    fooddata.forEach((day) {
      day.breakfast.forEach((food) {
        Food copy = isFoodinList(food, foods);
        if (copy != null) {
          copy.amount += food.amount;
        } else {
          foods.add(food.copy());
        }
      });
      day.lunch.forEach((food) {
        Food copy = isFoodinList(food, foods);
        if (copy != null) {
          copy.amount += food.amount;
        } else {
          foods.add(food.copy());
        }
      });
      day.dinner.forEach((food) {
        Food copy = isFoodinList(food, foods);
        if (copy != null) {
          copy.amount += food.amount;
        } else {
          foods.add(food.copy());
        }
      });
    });
    foods = getTop5(foods);
    if (foods.length > 0) {
      foods.forEach((food) {
        res.add(DataRow(cells: [
          DataCell(Text((res.length + 1).toString())),
          DataCell(Text(food.name)),
          DataCell(Text(food.amount.toStringAsFixed(0) + " g"))
        ]));
      });
    }
    return res;
  }

  Food isFoodinList(Food food, List<Food> list) {
    if (list.length == 0) {
      return null;
    } else {
      Food res;
      list.forEach((element) {
        if (element.id == food.id) {
          res = element;
        }
      });
      return res;
    }
  }

  List<Food> getTop5(List<Food> list) {
    List<Food> top5 = [];
    if (list.length > 0) {
      for (int i = 0; i < 5; i++) {
        Food most;
        list.forEach((element) {
          if (most == null) {
            most = element;
          } else if (element.amount > most.amount &&
              top5.indexOf(element) == -1) {
            most = element;
          }
        });
        top5.add(most);
      }
    }
    return top5;
  }

  // pie chart food

  dynamic getDataMapFor(String pos) {
    double breakfast = 0;
    double lunch = 0;
    double dinner = 0;
    fooddata.forEach((day) {
      day.breakfast.forEach((element) {
        pos == "Kalorien"
            ? breakfast += element.getCalories()
            : pos == "Kohlenhydrate"
                ? breakfast += element.getCarbs()
                : pos == "Protein"
                    ? breakfast += element.getProteins()
                    : breakfast += element.getFats();
      });
      day.lunch.forEach((element) {
        pos == "Kalorien"
            ? lunch += element.getCalories()
            : pos == "Kohlenhydrate"
                ? lunch += element.getCarbs()
                : pos == "Protein"
                    ? lunch += element.getProteins()
                    : lunch += element.getFats();
      });
      day.dinner.forEach((element) {
        pos == "Kalorien"
            ? dinner += element.getCalories()
            : pos == "Kohlenhydrate"
                ? dinner += element.getCarbs()
                : pos == "Protein"
                    ? dinner += element.getProteins()
                    : dinner += element.getFats();
      });
    });
    return {
      "Frühstück": (breakfast / fooddata.length),
      "Mittagessen": (lunch / fooddata.length),
      "Abendessen": (dinner / fooddata.length)
    };
  }

  // line chart food

  dynamic getLineChartFoodData() {
    List<FlSpot> spots = [];
    List<Color> colors = [];
    List<String> dates = [];
    fooddata.forEach((day) {
      spots.add(new FlSpot((spots.length + 1).toDouble(),
          (day.current - day.goal.kcal).toDouble()));
      dates.add(day.date.substring(0, day.date.lastIndexOf('.')));
      if (day.current > day.goal.kcal) {
        colors.add(Colors.red);
      } else {
        colors.add(Colors.green);
      }
    });
    return {"spots": spots, "colors": colors, "dates": dates};
  }

  // format training stuff

  void formatTraining(dynamic data) {
    List<Training> list = [];
    data.forEach((element) {
      list.add(Training.fromJson(element));
    });
    trainingdata = list;
  }

  // format food stuff

  void formatFood(dynamic data) {
    List<Day> list = [];
    data.forEach((element) {
      list.add(Day.fromJson(element));
    });
    fooddata = sortByDate(list);
  }

  List<Day> sortByDate(List<Day> data) {
    List<Day> list = [];
    while (data.length > 0) {
      Day earliest;
      data.forEach((element) {
        if (earliest == null) {
          earliest = element;
        } else if (compareDay(earliest, element) == 2) {
          earliest = element;
        }
      });
      list.add(earliest);
      data.remove(earliest);
    }
    return list;
  }

  int compareDay(Day day1, Day day2) {
    // returns 1 when day1 is earlier and 2 when day2 is earlier
    List<String> split_1 = day1.date.split('.');
    List<String> split_2 = day2.date.split('.');
    if (int.parse(split_1[2]) > int.parse(split_2[2])) {
      return 2;
    } else if (int.parse(split_1[2]) < int.parse(split_2[2])) {
      return 1;
    } else if (int.parse(split_1[1]) > int.parse(split_2[1])) {
      return 2;
    } else if (int.parse(split_1[1]) < int.parse(split_2[1])) {
      return 1;
    } else if (int.parse(split_1[0]) > int.parse(split_2[0])) {
      return 2;
    } else {
      return 1;
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class CaloriesService {
  List<Day> days;
  DateTime _time;
  AuthService _auth = AuthService();
  Day _day;
  CaloriesService() {
    _time = DateTime.now();
    days = [];
  }

  // change Date

  Future<void> setDate(DateTime date) async {
    _time = date;
    await fetchDay();
  }

  // getters

  DateTime getDate() {
    return _time;
  }

  Day getDay() {
    return _day;
  }

  String dateToString(DateTime time) {
    final int day = time.day;
    final int month = time.month;
    final int year = time.year;
    return "$day.$month.$year";
  }

  Day dayExists() {
    Day result;
    days.forEach((element) {
      if (dateToString(_time) == element.date) {
        result = element;
      }
    });
    return result;
  }

  Future<void> fetchDay() async {
    try {
      _day = dayExists();
      if (_day == null) {
        final String token = await _auth.getToken();
        http.Response res = await http.get(
            "https://europe-west3-muclery6669.cloudfunctions.net/calories",
            headers: {
              "authorization": "Bearer " + token,
              "date": dateToString(_time)
            });
        if (res.statusCode == 200) {
          _day = Day.fromJson(json.decode(res.body));
          days.add(_day);
        } else {
          print(res.body);
        }
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> updateDay() async {
    try {
      final String token = await _auth.getToken();
      await http.post(
          "https://europe-west3-muclery6669.cloudfunctions.net/calories",
          headers: {"authorization": "Bearer " + token},
          body: json.encode(_day.toJson()));
    } catch (err) {
      print(err);
    }
  }

  void addFoodToMeal(Food food, String mealName) async {
    _day.addFoodtoMeal(food, mealName);
  }
}

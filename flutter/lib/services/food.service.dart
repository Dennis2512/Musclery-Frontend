import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/screens/essen/details.dart';

class FoodService {
  List<Food> food = [];

  Future<void> fetchFood() async {
    try {
      food = [];
      var res = await http.get(
          "https://europe-west3-trainingstagebuch-f8308.cloudfunctions.net/food");
      if (res.statusCode == 200) {
        final dynamic js = json.decode(res.body);
        js.forEach((element) {
          food.add(Food.fromJson(element));
        });
      } else {
        print(res.body);
      }
    } catch (err) {
      print(err);
    }
  }

  List<Widget> getFoodTiles(
      BuildContext context, callback, String regex, List<String> regexcat) {
    List<Widget> list = [];
    List<Food> filtered =
        (regexcat.length > 0) ? filterByCategory(regexcat) : food;
    filtered = (regex != null && regex.length > 0 && filtered.length > 0)
        ? filter(regex, filtered)
        : filtered;
    filtered.forEach((element) {
      list.add(
        ListTile(
            title: Text(element.name),
            subtitle: Text(element.description +
                ", " +
                element.amount.toString() +
                " " +
                element.unit.name),
            trailing: Text(element.getCalories().toString()),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    food: Food.fromJson(
                        json.decode(json.encode(element.toJson()))),
                    origin: null,
                    title: "Nahrungsmittel hinzufügen",
                    mealCallback: callback,
                  ),
                ))),
      );
      list.add(Divider());
    });
    return list;
  }

  List<Food> getFood() {
    return food;
  }

  Future<String> addFood(Food food) async {
    try {
      var res = await http.post(
          "https://europe-west3-trainingstagebuch-f8308.cloudfunctions.net/food",
          body: {"food": json.encode(food.toJson())});

      if (res.statusCode == 200) {
        return res.body;
      } else {
        print(res.body);
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  searchFood(String code) async {
    // todo get food api data from https://platform.fatsecret.com/api/Default.aspx?screen=rapiref2&cpc=true&method=food.find_id_for_barcode
    // final String clientID = "b6449b877393465c9b0f8f7f6df0ef3b";
    // final String clientSecret = "2aa2bfd0c51448bebd95044877827032";
    print(code);
    /*
    try {
      final tokenRequest =
          await http.post("https://oauth.fatsecret.com/connect/token", body: {
        "grant_type": "client_credentials",
        "client_id": clientID,
        "client_secret": clientSecret,
        "scope": "basic"
      });
      final token = json.decode(tokenRequest.body)['access_token'];
      print(token);
      final foodRequest = await http.post(
          "https://platform.fatsecret.com/rest/server.api?method=food.find_id_for_barcode&barcode=" +
              code +
              "&format=json",
          headers: {
            "Authentication": "Bearer " + tokenRequest.body
          },
          body: {
            "oauth_signature_method": "HMAC-SHA1",
            "oauth_consumer_key": "b6449b877393465c9b0f8f7f6df0ef3b"
          });
      print(foodRequest.body);
      //final food_id = json.decode(food)
    } catch (err) {
      print(err);
    } */
  }

  List<Food> filter(String filter, List<Food> list) {
    List<Food> filtered = [];
    list.forEach((food) {
      if (food.name.toLowerCase().contains(filter.toLowerCase()) ||
          food.description.toLowerCase().contains(filter.toLowerCase())) {
        filtered.add(food);
      }
    });
    return filtered;
  }

  List<Food> filterByCategory(List<String> categories) {
    List<Food> filtered = [];
    food.forEach((food) {
      if (categories.any((element) => food.categories.contains(element))) {
        filtered.add(food);
      }
    });
    return filtered;
  }
}

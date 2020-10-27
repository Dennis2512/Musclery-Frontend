import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/screens/essen/details.dart';
import 'package:trainingstagebuch/screens/essen/foodCreator.dart';
import 'package:trainingstagebuch/screens/essen/chipDialog.dart';
import 'package:trainingstagebuch/services/exercise.service.dart';
import 'package:trainingstagebuch/services/food.service.dart';

class ExerciseAdder extends StatefulWidget {
  final String title;
  final Day day;
  final updateCallback;
  ExerciseAdder({this.title, this.day, this.updateCallback});
  @override
  _ExerciseAdderState createState() => _ExerciseAdderState();
}

class _ExerciseAdderState extends State<ExerciseAdder> {
  final FoodService fs = FoodService();
  final ExerciseService es = ExerciseService();
  final _controller = TextEditingController();
  List<Widget> list = [];
  bool loading = true;
  String regex;
  List<String> regexcat = [];
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    //await fs.fetchFood();
    await es.fetchExercises();
    setState(() {
      loading = false;
      list = es.getExerciseTiles();
    });
  }

  update() {
    widget.updateCallback();
    Navigator.pop(context);
  }

  created(Food food) async {
    food.id = await fs.addFood(food);
    setState(() {
      fs.food.add(food);
      list = fs.getFoodTiles(context, check, regex, regexcat);
    });
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(
            food: Food.fromJson(json.decode(json.encode(food.toJson()))),
            origin: null,
            title: "Nahrungsmittel hinzufügen",
            mealCallback: check,
          ),
        ));
  }

  check(Food origin, Food food) {
    setState(() {
      widget.day.addFoodtoMeal(food, widget.title);
    });
    Navigator.pop(context);
    Navigator.pop(context);
    widget.updateCallback();
  }

  scan() async {
    final ScanResult res = await BarcodeScanner.scan();
    await fs.searchFood(res.rawContent);
  }

  filter(String regex) {
    setState(() {
      regex = regex;
      list = fs.getFoodTiles(context, check, regex, regexcat);
    });
  }

  filterCallback(List<String> cats) {
    setState(() {
      regexcat = cats;
      list = fs.getFoodTiles(context, check, regex, regexcat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodCreator(
                      day: widget.day,
                      foodAdderCallback: created,
                    ),
                  )),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _controller,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: "Nahrungsmittel suchen",
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () =>
                                    {_controller.clear(), filter("")},
                              )),
                          onChanged: (value) => filter(value),
                          autofocus: false,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.center_focus_strong,
                          color: Colors.blue,
                          size: 35,
                        ),
                        onPressed: () => scan(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Filter:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Badge(
                          child: Chip(
                            label: Icon(Icons.filter_list),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          ),
                          badgeContent: Text(regexcat.length.toString()),
                          badgeColor: Colors.blue,
                        ),
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => ChipDialog(
                                  categories: List<String>.from(regexcat),
                                  callback: filterCallback,
                                )),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Divider(),
                ],
              ),
              loading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Colors.blue,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: list,
                      ),
                    )
            ],
          ),
        ));
  }
}

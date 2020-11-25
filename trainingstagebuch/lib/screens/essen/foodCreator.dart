import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/models/food.model.dart';
import 'package:trainingstagebuch/models/unit.mode.dart';

class FoodCreator extends StatefulWidget {
  final Day day;
  final foodAdderCallback;
  FoodCreator({this.day, this.foodAdderCallback});
  @override
  _FoodCreatorState createState() => _FoodCreatorState();
}

class _FoodCreatorState extends State<FoodCreator> {
  Food food = new Food(
      amount: 100,
      unit: new Unit(name: "Gramm", factor: 1.0),
      units: [
        new Unit(name: "Gramm", factor: 1.0),
        new Unit(name: "Ounce", factor: 0.035274)
      ],
      categories: []);
  final _foodformkey = GlobalKey<FormState>();
  bool loading = false;
  List<Widget> chips;

  List<Widget> getChips() {
    List<String> labels = [
      "Vegan",
      "Vegetarisch",
      "Fleisch",
      "Gemüse",
      "Obst",
      "Getränk",
      "Getreideprodukt",
      "Milchprodukt",
      "Fisch",
      "Eiprodukt",
      "Nahrungsergänzungsmittel",
      "Fett",
      "Öl",
      "Süßigkeit",
      "Snack"
    ];
    List<Widget> list = [];
    labels.forEach((label) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(InkWell(
        child: Chip(
            label: food.categories.contains(label)
                ? Wrap(
                    children: [
                      Icon(Icons.done),
                      SizedBox(
                        width: 5,
                      ),
                      Text(label)
                    ],
                    crossAxisAlignment: WrapCrossAlignment.center,
                  )
                : Text(label),
            backgroundColor: food.categories.contains(label)
                ? Colors.blue
                : Colors.grey[400]),
        onTap: () => setState(() => {
              food.categories.contains(label)
                  ? food.categories.remove(label)
                  : food.categories.add(label),
              chips = getChips()
            }),
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    chips = getChips();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Neues Nahrungsmittel"),
          actions: [
            loading
                ? SpinKitThreeBounce(
                    color: Colors.white,
                    size: 20,
                  )
                : IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () => validate(),
                  ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Form(
              autovalidate: false,
              key: _foodformkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: "Name",
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                    onChanged: (value) => setState(() => food.name = value),
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: "Description",
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value.length > 0 ? null : "Dies ist ein Pflichtfeld!",
                    onChanged: (value) =>
                        setState(() => food.description = value),
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Nährwerte auf 100g:"),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: "kcal",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          textInputAction: TextInputAction.next,
                          validator: (value) => int.tryParse(value) == null
                              ? "Nur gültige Integer-Zahlen"
                              : null,
                          onChanged: (value) => setState(() => {
                                if (int.tryParse(value) != null)
                                  food.calories = int.parse(value)
                              }),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: "Kohlenhydrate",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          textInputAction: TextInputAction.next,
                          validator: (value) => double.tryParse(value) == null
                              ? "Nur gültige Dezimal-Zahlen"
                              : null,
                          onChanged: (value) => setState(() => {
                                if (double.tryParse(value) != null)
                                  food.carbs = double.parse(value)
                              }),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: "Proteine",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          textInputAction: TextInputAction.next,
                          validator: (value) => double.tryParse(value) == null
                              ? "Nur gültige Dezimal-Zahlen"
                              : null,
                          onChanged: (value) => setState(() => {
                                if (double.tryParse(value) != null)
                                  food.protein = double.parse(value)
                              }),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelText: "Fette",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          textInputAction: TextInputAction.next,
                          validator: (value) => double.tryParse(value) == null
                              ? "Nur gültige Dezimal-Zahlen"
                              : null,
                          onChanged: (value) => setState(() => {
                                if (double.tryParse(value) != null)
                                  food.fats = double.parse(value)
                              }),
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Kategorien"),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: getChips(),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  validate() {
    FocusScope.of(context).unfocus();
    setState(() {
      loading = true;
    });
    if (_foodformkey.currentState.validate()) {
      widget.foodAdderCallback(food);
    } else {
      setState(() {
        loading = false;
      });
    }
  }
}

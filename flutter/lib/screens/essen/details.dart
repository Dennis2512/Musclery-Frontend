import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trainingstagebuch/models/food.model.dart';

class Details extends StatefulWidget {
  final Food food, origin;
  final String title;
  final mealCallback;
  Details({this.food, this.origin, this.title, this.mealCallback});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  getChips() {
    List<Widget> list = [];
    widget.food.categories.forEach((category) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(Chip(
        label: Text(category),
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> items = getUnitItems();
    double menge = widget.food.amount;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => {widget.mealCallback(widget.origin, widget.food)},
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(widget.food.name),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(widget.food.description),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("Einheit"),
              trailing: DropdownButton(
                items: items,
                onChanged: (value) => {
                  setState(() =>
                      {widget.food.unit = widget.food.getUnitWithName(value)}),
                },
                value: widget.food.unit.name,
                style: TextStyle(color: Colors.blue, fontSize: 17),
                underline: Container(),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("Menge"),
              trailing: InkWell(
                child: Text(
                  widget.food.amount.toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text("Menge"),
                    children: [
                      TextFormField(
                        initialValue: menge.toString(),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        maxLength: 6,
                        onChanged: (value) =>
                            setState(() => {menge = double.parse(value)}),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Text(
                          "Speichern",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                    contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 20),
                  ),
                ).then((value) => setState(() => {widget.food.amount = menge})),
              ),
              contentPadding: EdgeInsets.fromLTRB(16, 0, 50, 0),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                PieChart(
                  dataMap: {
                    "carbs": widget.food.carbs,
                    "protein": widget.food.protein,
                    "fats": widget.food.fats
                  },
                  chartRadius: 80,
                  chartType: ChartType.ring,
                  centerText: widget.food.getCalories().toString() + "\nkcal",
                  colorList: [Colors.blue, Colors.green, Colors.red],
                  ringStrokeWidth: 10,
                  chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: false,
                      chartValueStyle:
                          TextStyle(fontSize: 20, color: Colors.black)),
                  legendOptions: LegendOptions(showLegends: false),
                ),
                Column(
                  children: [
                    Text(
                      (widget.food.carbs /
                                  (widget.food.carbs +
                                      widget.food.fats +
                                      widget.food.protein) *
                                  100)
                              .round()
                              .toString() +
                          " %",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      double.parse(widget.food.getCarbs().toStringAsFixed(1))
                              .toString() +
                          " g",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Kohlenhydrate", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      (widget.food.protein /
                                  (widget.food.carbs +
                                      widget.food.fats +
                                      widget.food.protein) *
                                  100)
                              .round()
                              .toString() +
                          " %",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      double.parse(widget.food.getProteins().toStringAsFixed(1))
                              .toString() +
                          " g",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Proteine", style: TextStyle(color: Colors.green)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      (widget.food.fats /
                                  (widget.food.carbs +
                                      widget.food.fats +
                                      widget.food.protein) *
                                  100)
                              .round()
                              .toString() +
                          " %",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      double.parse(widget.food.getFats().toStringAsFixed(1))
                              .toString() +
                          " g",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Fette", style: TextStyle(color: Colors.red)),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            Divider(color: Colors.grey),
            Wrap(
              children: getChips(),
              alignment: WrapAlignment.start,
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getUnitItems() {
    List<DropdownMenuItem> res = [];
    widget.food.units.forEach((unit) {
      res.add(DropdownMenuItem(
        value: unit.name,
        child: Text(unit.name),
      ));
    });
    return res;
  }
}

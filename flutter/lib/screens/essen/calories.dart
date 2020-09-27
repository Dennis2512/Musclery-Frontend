import 'package:flutter/material.dart';
import 'package:trainingstagebuch/models/day.model.dart';

class Calories extends StatefulWidget {
  final Day day;
  Calories({this.day});
  @override
  _CaloriesState createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Kalorien verbleibend",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.day.goal.kcal.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Ziel",
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 20),
                  ),
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      widget.day.current.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Heute",
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 20),
                  ),
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      widget.day.getRest().toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: widget.day.getRest() >= 0
                              ? Colors.green
                              : Colors.red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Übrig",
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          )
        ],
      ),
    );
  }
}

/**SizedBox(
        height: 80,
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "2400",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Ziel", style: TextStyle(fontSize: 15, color: Colors.grey))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ) */

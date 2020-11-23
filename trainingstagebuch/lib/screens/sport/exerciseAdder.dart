import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/training.model.dart';
import 'package:trainingstagebuch/services/exercise.service.dart';
import 'package:trainingstagebuch/services/food.service.dart';

class ExerciseAdder extends StatefulWidget {
  final String title;
  final Training training;
  final updateCallback;
  ExerciseAdder({this.title, this.updateCallback, this.training});
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
      list =
          es.getExerciseTiles(context, widget.training, widget.updateCallback);
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
              onPressed: () => {},
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 370,
                          child: TextFormField(
                            controller: _controller,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                hintText: "Übung suchen",
                                hintStyle:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                fillColor: Colors.grey[200],
                                filled: true,
                                prefixIcon: Icon(Icons.search),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () => {_controller.clear()},
                                )),
                            autofocus: false,
                          )),
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
                        onTap: () =>
                            {}, /*showDialog(
                            context: context,
                            builder: (context) => ChipDialog(
                                  categories: List<String>.from(regexcat),
                                  callback: filterCallback,
                                ))*/
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

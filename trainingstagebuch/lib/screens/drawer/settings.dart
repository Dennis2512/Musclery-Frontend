import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final formKey = GlobalKey<FormState>();
  Map data = {'name': String, 'gender': String, 'age': int, 'height': int, 'weight': int, 'calories': int, 'activity_lvl': String};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: true),
      body:
      Center(
      child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Personal Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name',
                          icon: Icon(Icons.person),
                          hintText: 'What do people call you?'),
                      onSaved: (input) => data['name'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Gender',
                          icon: Icon(Icons.tag),
                          hintText: 'What`s your gender?'),
                      onSaved: (input) => data['gender'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Age (years)',
                          icon: Icon(Icons.face_rounded),
                          hintText: 'How young do you feel?'),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onSaved: (input) => data['age'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Height (cm)',
                          icon: Icon(Icons.straighten_rounded),
                          hintText: 'How tall are you?'),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onSaved: (input) => data['height'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          icon: Icon(Icons.pregnant_woman_rounded),
                          hintText: 'How light are you?'),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onSaved: (input) => data['weight'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Calories Goal (kcal)',
                          icon: Icon(Icons.local_dining_rounded),
                          hintText: 'What`s your max. of kcal per day?'),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onSaved: (input) => data['calories'] = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Activity Level',
                          icon: Icon(Icons.directions_bike_rounded),
                          hintText: 'How active are you?'),
                      onSaved: (input) => data['activity_lvl'] = input,
                    ),
                    new Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.save_rounded),
                      onPressed: () => formKey.currentState.save(),
                      label: Text('Save Settings'),
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      splashColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 100),
                    )
                  ]),
            ),
          )),
    )
    ));
  }
}

import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final DateTime date;
  final dynamic callback;
  Header({this.date, this.callback});
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              child: SizedBox(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.blue,
                ),
                width: 70,
                height: 60,
              ),
              onTap: () async => await widget.callback(new DateTime(
                  widget.date.year, widget.date.month, widget.date.day - 1))),
          InkWell(
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: Text(
                  getDateString(widget.date),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
            onTap: () => {
              showDatePicker(
                      context: context,
                      initialDate: widget.date,
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2100))
                  .then((value) => setState(
                      () => {if (value != null) widget.callback(value)}))
            },
          ),
          InkWell(
            child: SizedBox(
              child: Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              width: 70,
              height: 60,
            ),
            onTap: () async => await widget.callback(new DateTime(
                widget.date.year, widget.date.month, widget.date.day + 1)),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[200]))),
    );
  }

  String getDateString(_time) {
    final now = DateTime.now();
    final check = DateTime(_time.year, _time.month, _time.day);
    if (check == DateTime(now.year, now.month, now.day)) {
      return "Heute";
    } else if (check == DateTime(now.year, now.month, now.day - 1)) {
      return "Gestern";
    } else if (check == DateTime(now.year, now.month, now.day + 1)) {
      return "Morgen";
    } else {
      return dateToString(_time);
    }
  }

  String dateToString(DateTime time) {
    final day = time.day;
    final month = time.month;
    final year = time.year;
    return "$day.$month.$year";
  }
}

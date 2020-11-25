import 'package:flutter/material.dart';

class ChipDialog2 extends StatefulWidget {
  final List<String> categories;
  final callback;
  ChipDialog2({this.categories, this.callback});
  @override
  _ChipDialog2State createState() => _ChipDialog2State();
}

class _ChipDialog2State extends State<ChipDialog2> {
  List<Widget> chips;

  getChips() {
    List<String> labels = [
      "Brust",
      "Bizeps",
      "Beine",
      "Trizeps",
      "Schultern",
      "Nacken",
      "Rücken",
      "Po",
      "Bauch",
      "Unterkörper",
      "Oberkörper"
    ];
    List<Widget> list = [];
    labels.forEach((label) {
      list.add(SizedBox(
        width: 10,
      ));
      list.add(InkWell(
        child: Chip(
            label: widget.categories.contains(label)
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
            backgroundColor: widget.categories.contains(label)
                ? Colors.blue
                : Colors.grey[400]),
        onTap: () => setState(() => {
              widget.categories.contains(label)
                  ? widget.categories.remove(label)
                  : widget.categories.add(label),
              chips = getChips()
            }),
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    chips = getChips();
    return SimpleDialog(
      title: Text("Nach Kategorien suchen"),
      children: [
        Divider(),
        Wrap(
          children: chips,
        ),
        Divider(),
        SizedBox(
          height: 7,
        ),
        Row(children: [
          InkWell(
            child: Text(
              "Alle entfernen",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () =>
                {widget.callback(List<String>.empty()), Navigator.pop(context)},
          ),
          InkWell(
            child: Text(
              "Speichern",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            onTap: () =>
                {widget.callback(widget.categories), Navigator.pop(context)},
          )
        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
      ],
      contentPadding: EdgeInsets.fromLTRB(10, 12, 15, 15),
    );
  }
}

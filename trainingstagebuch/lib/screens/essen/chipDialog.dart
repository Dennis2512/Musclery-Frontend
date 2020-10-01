import 'package:flutter/material.dart';

class ChipDialog extends StatefulWidget {
  final List<String> categories;
  final callback;
  ChipDialog({this.categories, this.callback});
  @override
  _ChipDialogState createState() => _ChipDialogState();
}

class _ChipDialogState extends State<ChipDialog> {
  List<Widget> chips;

  getChips() {
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

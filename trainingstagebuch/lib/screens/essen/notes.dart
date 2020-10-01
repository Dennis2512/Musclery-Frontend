import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/services/notes.service.dart';

class Notes extends StatefulWidget {
  final Day day;
  Notes({this.day});
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final NotesService _ns = NotesService();
  String input = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text("Notizen"),
        actions: [
          loading
              ? SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                )
              : IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => saveNote(),
                ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: TextFormField(
          expands: true,
          minLines: null,
          maxLines: null,
          initialValue: widget.day.notes,
          onChanged: (value) => setState(() => input = value),
          decoration: InputDecoration(
            hintText: "Hier können Sie ihre Notizen schreiben.",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            contentPadding: EdgeInsets.all(10),
          )),
    );
  }

  saveNote() async {
    setState(() {
      loading = true;
      widget.day.setNotes(input);
    });
    final res = await _ns.saveNotes(widget.day);
    if (res) {
      Navigator.pop(context);
    } else {
      setState(() {
        loading = false;
      });
    }
  }
}

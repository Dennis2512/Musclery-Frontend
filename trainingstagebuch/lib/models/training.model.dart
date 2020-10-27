import 'package:cloud_firestore/cloud_firestore.dart';

class Training {
  String id, name, beschreibung, notes;
  DateTime date;
  Training({this.id, this.name, this.beschreibung, this.date, this.notes});
  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['data']['name'],
        date = transformDate(json['data']["date"]),
        beschreibung = json['data']['beschreibung'],
        notes = json['data']["notes"];
  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "beschreibung": beschreibung,
        "notes": notes
      };

  static transformDate(dynamic date) {
    return new Timestamp(date['_seconds'], date['_nanoseconds']).toDate();
  }
}

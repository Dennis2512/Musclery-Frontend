import 'package:cloud_firestore/cloud_firestore.dart';

class Training {
  String id, name, notes;
  DateTime date;
  Training({this.name, this.date, this.notes});
  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['data']['name'],
        date = transformDate(json['data']["date"]),
        notes = json['data']["notes"];
  Map<String, Object> toJson() =>
      {"id": id, "name": name, "date": date, "notes": notes};

  static transformDate(dynamic date) {
    return new Timestamp(date['_seconds'], date['_nanoseconds']).toDate();
  }
}

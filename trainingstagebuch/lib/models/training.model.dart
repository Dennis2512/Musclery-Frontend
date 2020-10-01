class Training {
  String id, name, date, notes;
  Training({this.name, this.date, this.notes});
  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['data']['name'],
        date = json['data']["date"],
        notes = json['data']["date"];
  Map<String, Object> toJson() =>
      {"id": id, "name": name, "date": date, "notes": notes};
}

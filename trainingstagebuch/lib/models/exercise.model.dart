class Exercise {
  String name, beschreibung, id;
  List<String> muskelgruppen;

  Exercise({this.id, this.name, this.beschreibung, this.muskelgruppen});
  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        beschreibung = json['beschreibung'],
        muskelgruppen = transformToStringList(json['muskelgruppen']);

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "beschreibung": beschreibung,
        "muskelgruppen": muskelgruppen
      };

  static List<String> transformToStringList(List list) {
    List<String> res = [];
    list.forEach((muskelgruppe) {
      res.add(muskelgruppe);
    });
    return res;
  }
}

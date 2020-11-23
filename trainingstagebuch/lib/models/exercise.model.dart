import 'package:trainingstagebuch/models/set.model.dart';

class Exercise {
  String name, beschreibung, id;
  List<String> muskelgruppen;
  List<Set> sets;

  Exercise(
      {this.id, this.name, this.beschreibung, this.muskelgruppen, this.sets});
  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        beschreibung = json['beschreibung'],
        muskelgruppen = transformToStringList(json['muskelgruppen']),
        sets = transformSets(json['sets']);

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "beschreibung": beschreibung,
        "muskelgruppen": muskelgruppen,
        "sets": sets
      };

  static List<String> transformToStringList(List list) {
    List<String> res = [];
    list.forEach((muskelgruppe) {
      res.add(muskelgruppe);
    });
    return res;
  }

  static List<Set> transformSets(List list) {
    List<Set> res = [];
    list.forEach((element) {
      res.add(Set.fromJson(element));
    });
    return res;
  }

  Exercise copy() {
    List<Set> setcopy = [];
    sets.forEach((element) {
      setcopy.add(element.copy());
    });
    return new Exercise(
        beschreibung: beschreibung,
        id: id,
        muskelgruppen: muskelgruppen,
        name: name,
        sets: setcopy);
  }
}

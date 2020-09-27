class Unit {
  String name;
  double factor;
  Unit({this.name, this.factor});
  Unit.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        factor = json['factor'].toDouble();

  Map<String, Object> toJson() => {"name": name, "factor": factor};
}

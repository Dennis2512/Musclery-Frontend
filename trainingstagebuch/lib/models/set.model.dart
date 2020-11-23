class Set {
  int gewicht, reps;
  Set({this.gewicht, this.reps});
  Set.fromJson(Map<String, dynamic> json)
      : gewicht = json['gewicht'],
        reps = json['reps'];

  Map<String, Object> toJson() => {"gewicht": gewicht, "reps": reps};

  Set copy() {
    return new Set(gewicht: gewicht, reps: reps);
  }
}

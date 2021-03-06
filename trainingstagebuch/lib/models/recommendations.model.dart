class Recommendation {
  final String trainingExerciseTitle;
  final String trainingExerciseType;
  final int numberOfSets;
  final int numberOfRepetitionsOrDuration;
  final List<String> muscle;
  final String imageUrl;

  Recommendation(
      this.trainingExerciseTitle,
      this.trainingExerciseType,
      this.numberOfSets,
      this.numberOfRepetitionsOrDuration,
      this.muscle,
      this.imageUrl);


static String getMuscleList(List<String> muscles) {
  String muscleList;
  muscleList = muscles.join(", ");
  return muscleList;
}

}
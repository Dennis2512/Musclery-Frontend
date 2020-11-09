class PersonalData {
  final String bodyHeight;
  final String bodyWeight;
  final String age;
  final String gender;
  final String bmiValue;

  PersonalData(
      this.bodyHeight, this.bodyWeight, this.age, this.gender, this.bmiValue);

  static String calculateBmiValue(double bodyHeight, double bodyWeight) {
    double bodyHeightInMeters = bodyHeight / 100;
    double bodyHeightSquare = bodyHeightInMeters * bodyHeightInMeters;
    double bmiValue = bodyWeight / bodyHeightSquare;
    double bmiValueRounded = double.parse((bmiValue).toStringAsFixed(2));
    String bmiResult = bmiValueRounded.toString();
    return bmiResult;
  }
}

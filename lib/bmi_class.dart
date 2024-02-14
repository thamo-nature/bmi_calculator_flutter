import 'dart:math';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final int height;
  final int weight;

  late double bmi;

  String findBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String condition() {
    if (bmi > 25) {
      return 'Over Weight';
    } else if (bmi > 18) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }
}

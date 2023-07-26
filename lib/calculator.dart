import 'dart:math';

class BMICalculator {
  BMICalculator({
    required this.weight,
    required this.height,
  });
  late double _bMIIndex;
  final int weight;
  final int height;

  String countBMI() {
    _bMIIndex = weight / pow(height / 100, 2);
    return _bMIIndex.toStringAsFixed(1);
  }

  String returnCondition() {
    if (_bMIIndex >= 25) {
      return 'Overweight';
    } else if (_bMIIndex >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}

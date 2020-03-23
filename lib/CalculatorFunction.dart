import 'dart:math';

class CalculatorFuction {
  final int height;
  final int weight;
  CalculatorFuction({this.height, this.weight});
  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  //method to calculate and display weight in UI
  String resultOfBmi() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 17.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  //method to show Users feedback to client about what there weights says about them.
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have avhigher body weight,than the usual. Try to Exercise More and Maintain a Caloric deficit Diet. ';
    } else if (_bmi > 17.5) {
      return 'You have a normal body weight. Congratulations!!!';
    } else {
      return 'Your Weight seems to be pretty Low, You should pack on more Calories.';
    }
  }
}

import 'package:hello_flutter/Model/calculator_logic.dart';

class CalculatorController {
  // final ConverterModel _model = ConverterModel();
  final Calculator_Logic _model = Calculator_Logic();

  void history() {
    _model.deleteAllData();
  }

  // String calculate(){
  //   return _model.
  // }
  // String convert(double inputValue) {
  //   return _model.convertKilometersToMiles(inputValue);
  // }
}

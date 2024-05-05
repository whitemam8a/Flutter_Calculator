import 'package:hello_flutter/Model/ConverterModel.dart';

class ConverterController {
  final ConverterModel _model = ConverterModel();

  String convert(double inputValue) {
    double resultValue = _model.convertKilometersToMiles(inputValue);
    return resultValue.toStringAsFixed(2);
  }
}

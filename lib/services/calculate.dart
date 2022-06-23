import 'package:flutter/material.dart';

class Calculate {
  double celsius = 0;
  double kelvin = 0;
  double fahrenheit = 0;

  var celsiusControler;
  var kelvinControler;
  var fahrenheitControler;

  Calculate(
      {this.celsiusControler, this.kelvinControler, this.fahrenheitControler});

  void resetFields(bool desfoca,
      {required bool celsius, required bool kelvin, required bool fahrenheit}) {
    if (celsius == true) celsiusControler.text = "";
    if (kelvin == true) kelvinControler.text = "";
    if (fahrenheit == true) fahrenheitControler.text = "";
    if (desfoca == true) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
  }

  void celsiusChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: false, kelvin: true, fahrenheit: true);
    else {
      celsius = double.parse(text);
      kelvin = double.parse((celsius + 273.15).toStringAsFixed(2));
      fahrenheit = double.parse((celsius * 9 / 5 + 32).toStringAsFixed(2));

      if (kelvinControler != null && fahrenheitControler != null) {
        kelvinControler.text = kelvin.toString();
        fahrenheitControler.text = fahrenheit.toString();
      }
    }
  }

  void kelvinChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: true, kelvin: false, fahrenheit: true);
    else {
      kelvin = double.parse(text);

      celsius = double.parse((kelvin - 273.15).toStringAsFixed(2));
      fahrenheit = double.parse((((kelvin - 273.15) / 5) * 9 + 32).toStringAsFixed(2));

      if (celsiusControler != null && fahrenheitControler != null) {
        celsiusControler.text = celsius.toString();
        fahrenheitControler.text = fahrenheit.toString();
      }
    }
  }

  void fahrenheitChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: true, kelvin: true, fahrenheit: false);
    else {
      fahrenheit = double.parse(text);
      celsius = double.parse(((fahrenheit - 32) * 5 / 9).toStringAsFixed(2));
      kelvin = double.parse((((fahrenheit - 32) / 9) * 5 + 273.15).toStringAsFixed(2));

      if (celsiusControler != null && kelvinControler != null) {
        celsiusControler.text = celsius.toString();
        kelvinControler.text = kelvin.toString();
      }
    }
  }
}

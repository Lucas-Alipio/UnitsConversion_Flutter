import 'package:flutter/material.dart';

class Calculate {

  double celsius = 0;
  double kelvin = 0;
  double fahrenheit = 0;

  var celsiusControler;
  var kelvinControler ;
  var fahrenheitControler;

  Calculate({this.celsiusControler, this.kelvinControler, this.fahrenheitControler});

  void resetFields(bool desfoca,
      {required bool celsius, required bool kelvin, required bool fahrenheit}) {
    if (celsius == true) celsiusControler.text = "";
    if (kelvin == true) kelvinControler.text = "";
    if (fahrenheit == true) fahrenheitControler.text = "";
    if (desfoca == true) {
      WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
    }
  }

  void celsiusChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: false, kelvin: true, fahrenheit: true);
    else {
      celsius = double.parse(text);
      kelvinControler.text = (celsius + 273.15).toStringAsFixed(2);
      fahrenheitControler.text = (celsius * 9 / 5 + 32).toStringAsFixed(2);
    }
  }

  void kelvinChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: true, kelvin: false, fahrenheit: true);
    else {
      kelvin = double.parse(text);
      celsiusControler.text = (kelvin - 273.15).toStringAsFixed(2);
      fahrenheitControler.text =
          (((kelvin - 273.15) / 5) * 9 + 32).toStringAsFixed(2);
    }
  }

  void fahrenheitChanged(String text) {
    if (text.isEmpty)
      resetFields(false, celsius: true, kelvin: true, fahrenheit: false);
    else {
      fahrenheit = double.parse(text);
      celsiusControler.text = ((fahrenheit - 32) * 5 / 9).toStringAsFixed(2);
      kelvinControler.text =
          (((fahrenheit - 32) / 9) * 5 + 273.15).toStringAsFixed(2);
    }
  }
}

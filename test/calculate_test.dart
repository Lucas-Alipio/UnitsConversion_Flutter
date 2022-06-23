import 'package:test/test.dart';
import 'package:unitsconversion/services/calculate.dart';

void main() {
  test('Tests celcius to kelvin conversion', () {
    Calculate calculate = Calculate();

    calculate.celsiusChanged("23");

    expect(calculate.kelvin, 296.15);
  });

  test('Tests celcius to fahrenheit conversion', () {
    Calculate calculate = Calculate();

    calculate.celsiusChanged("25");

    expect(calculate.fahrenheit, 77.0);
  });

  test('Tests fahrenheit to celcius conversion', () {
    Calculate calculate = Calculate();

    calculate.fahrenheitChanged("65");

    expect(calculate.celsius, 18.33);
  });

  test('Tests kelvin to celcius conversion', () {
    Calculate calculate = Calculate();

    calculate.kelvinChanged("0");

    expect(calculate.celsius, -273.15);
  });
}
import 'package:test/test.dart';
import 'package:unitsconversion/services/calculate.dart';


void main() {
  test('Tests celcius to kelvin conversion', () {

    var calculate = Calculate();

    calculate.celsiusChanged("23");

    expect(calculate.kelvin, 296.15);
  });
}

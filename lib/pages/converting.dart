import 'package:flutter/material.dart';
import 'package:unitsconversion/builders/designs.dart';
import 'package:unitsconversion/services/calculate.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {

  final celsiusControler = TextEditingController();
  final kelvinControler = TextEditingController();
  final fahrenheitControler = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Calculate calculate = Calculate(celsiusControler: celsiusControler, kelvinControler: kelvinControler, fahrenheitControler: fahrenheitControler);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Converter Temperatura",
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
                calculate.resetFields(true,
                    celsius: true, kelvin: true, fahrenheit: true);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.rotate_right,
                size: 150, 
                color: Colors.redAccent
              ),
              const SizedBox(
                height: 40,
              ),
              buildTextField("Celsius", "C", celsiusControler, calculate.celsiusChanged),
              const Divider(),
              buildTextField("Kelvin", "K", kelvinControler, calculate.kelvinChanged),
              const Divider(),
              buildTextField("Fahrenheit", "F", fahrenheitControler, calculate.fahrenheitChanged),
              const Divider(),
            ],
          ),
        ));
  }
}

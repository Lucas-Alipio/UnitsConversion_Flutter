import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Units Conversion',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TemperaturePage(title: 'Temperature conversion'),
    );
  }
}


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

  double celsius = 0;
  double kelvin = 0;
  double fahrenheit = 0;

  void _celsiusChanged(String text) {
    if (text.isEmpty)
      _resetFields(false, celsius: false, kelvin: true, fahrenheit: true);
    else {
      celsius = double.parse(text);
      kelvinControler.text = (celsius+273.15).toStringAsFixed(2);
      fahrenheitControler.text = (celsius*9/5 + 32).toStringAsFixed(2);
    }
  }

  void _kelvinChanged(String text) {
    if (text.isEmpty)
      _resetFields(false, celsius: true, kelvin: false, fahrenheit: true);
    else {
      kelvin = double.parse(text);
      celsiusControler.text = (kelvin - 273.15).toStringAsFixed(2);
      fahrenheitControler.text = (((kelvin-273.15)/5)*9 + 32).toStringAsFixed(2);
    }
  }

  void _fahrenheitChanged(String text) {
    if (text.isEmpty)
      _resetFields(false, celsius: true, kelvin: true, fahrenheit: false);
    else {
      fahrenheit = double.parse(text);
      celsiusControler.text = ((fahrenheit-32) * 5/9).toStringAsFixed(2);
      kelvinControler.text = (((fahrenheit-32)/9)*5 + 273.15).toStringAsFixed(2);
    }
  }

  void _resetFields (bool desfoca, {required bool celsius, required bool kelvin, required bool fahrenheit}) {
    if (celsius == true) celsiusControler.text = "";
    if (kelvin == true) kelvinControler.text = "";
    if (fahrenheit == true) fahrenheitControler.text = "";
    if (desfoca == true){
      WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Converter Temperatura",
          style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () {
              _resetFields(true, celsius: true, kelvin: true, fahrenheit: true);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.device_thermostat_sharp, size: 170, color: Colors.lightBlue),
            SizedBox(
              height: 60,
            ),
            buildTextField("Celsius", "C", celsiusControler, _celsiusChanged),
            Divider(),
            buildTextField("Kelvin", "K", kelvinControler, _kelvinChanged),
            Divider(),
            buildTextField("Fahrenheit", "F", fahrenheitControler, _fahrenheitChanged),
            Divider(),
          ],
        ),
      )
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, Function(String) f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.lightBlue),
      border: OutlineInputBorder(),
      prefixText: prefix
    ),
    style: TextStyle(color: Colors.black, fontSize: 20),
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}
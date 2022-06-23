import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix, TextEditingController c, Function(String) f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue
          )
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue
          )
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue
          )
        ),
        suffix: Text(prefix)
      ),
    style: const TextStyle(color: Colors.black, fontSize: 20),
    onChanged: f,
    keyboardType: TextInputType.phone,
  );
}

import 'package:flutter/material.dart';

class TextFieldSApp extends StatelessWidget {
  TextFieldSApp({super.key,
    required this.lable,
    required this.hint,
  });
  String lable = "";
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: lable,
          fillColor: Colors.white,
          filled: true,
          hintText: hint,
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}
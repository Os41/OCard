import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFelidApp extends StatelessWidget {
  TextFelidApp({
    required this.icon,
    required this.hint,
  });
  Icon icon;
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: icon,
          hintText: hint,
          contentPadding: const EdgeInsets.all(17),
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
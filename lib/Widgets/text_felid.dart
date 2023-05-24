import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_card/Data/constants.dart';

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
          fillColor: Color(whiteColor),
          filled: true,
          prefixIcon: icon,
          hintText: hint,
          contentPadding: EdgeInsets.all(17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}

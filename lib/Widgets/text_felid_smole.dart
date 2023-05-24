import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_card/Data/constants.dart';

class TextFelidSApp extends StatelessWidget {
  TextFelidSApp({
    required this.lable,
    required this.hint,
  });
  String lable = "";
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: lable,
          fillColor: Color(whiteColor),
          filled: true,
          hintText: hint,
          contentPadding: EdgeInsets.all(10),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_card/Data/constants.dart';

class TextFelidbApp extends StatelessWidget {
  TextFelidbApp({
    required this.hint,
  });
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        minLines: 10,
        maxLength: 500,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFelidbApp extends StatelessWidget {
  TextFelidbApp({
    required this.hint,
  });
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        minLines: 10,
        maxLength: 500,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
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
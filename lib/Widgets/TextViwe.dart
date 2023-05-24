import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_card/Data/constants.dart';

class TextApp extends StatelessWidget {
  TextApp({
    required this.lable,
  });
  String lable = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        lable,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFF211E1E)),
      ),
    );
  }
}

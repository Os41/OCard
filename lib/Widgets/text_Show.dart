import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_card/Data/constants.dart';

class TextShow extends StatelessWidget {
  TextShow({
    required this.label,
    required this.width,
  });
  String label = "";
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.black54),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

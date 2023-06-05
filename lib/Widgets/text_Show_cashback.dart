import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextShowCach extends StatelessWidget {
  TextShowCach({
    required this.label,
    required this.width,
  });
  String label = "";
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.black54),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
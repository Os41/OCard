import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonApp extends StatelessWidget {
  final String label;
  final VoidCallback onSaveButtonPressed;

  const ButtonApp({
    required this.label,
    required this.onSaveButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: MaterialButton(
        height: 50,
        minWidth: 300,
        color: Color(0xFF1E1B1B),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        onPressed: onSaveButtonPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

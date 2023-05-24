import 'package:flutter/material.dart';

class DottedLineBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dotSpacing;

  DottedLineBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dotSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double dashWidth = 4;
    final double dashSpace = dotSpacing - dashWidth;

    double distance = 0;
    while (distance < size.width) {
      canvas.drawLine(
        Offset(distance, 0),
        Offset(distance + dashWidth, 0),
        paint,
      );
      distance += dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

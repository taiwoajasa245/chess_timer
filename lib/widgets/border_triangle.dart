import 'package:flutter/material.dart';

class TriangleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    // Top triangle (points downward)
    path.moveTo(size.width / 2 - 20, 0); // Start from left of triangle
    path.lineTo(size.width / 2, 20); // Tip of triangle
    path.lineTo(size.width / 2 + 20, 0); // Right of triangle
    path.moveTo(0, 0); // Move back to starting point

    // Top line (from start to left of triangle)
    path.lineTo(size.width / 2 - 20, 0);
    // Right side line (from right of triangle to end)
    path.moveTo(size.width / 2 + 20, 0);
    path.lineTo(size.width, 0);

    // Bottom triangle (points upward)
    path.moveTo(
        size.width / 2 - 20, size.height); // Start from left of triangle
    path.lineTo(size.width / 2, size.height - 20); // Tip of triangle
    path.lineTo(size.width / 2 + 20, size.height); // Right of triangle
    path.moveTo(0, size.height); // Move back to starting point

    // Bottom line (from start to left of triangle)
    path.lineTo(size.width / 2 - 20, size.height);
    // Right side line (from right of triangle to end)
    path.moveTo(size.width / 2 + 20, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

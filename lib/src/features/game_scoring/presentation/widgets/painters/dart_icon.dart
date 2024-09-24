import 'package:flutter/material.dart';

import '../../../../../core/constant_variables.dart';

class DartIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = primaryWhite;
    paint.style = PaintingStyle.fill;
    final flightPath = Path();
    flightPath.addPolygon([
      Offset(size.width * 0.5, 0),
      Offset(size.width, size.width * 0.2),
      Offset(size.width, size.width * 0.7),
      Offset(size.width * 0.5, size.width * 1.2),
      Offset(0, size.width * 0.7),
      Offset(0, size.width * 0.2),
    ], true);
    canvas.drawPath(flightPath, paint);
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = size.width * 0.3;

    canvas.drawLine(Offset(size.width * 0.5, size.width + size.width * 0.4),
        Offset(size.width * 0.5, size.height - size.width * 0.2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

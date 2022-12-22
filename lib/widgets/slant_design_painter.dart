import 'package:flutter/material.dart';

class SlantDesignPainter extends CustomPainter {
  final BuildContext context;
  final String section;

  SlantDesignPainter({required this.context, required this.section});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Theme.of(context).primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(size.width, -0.1 * size.width);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

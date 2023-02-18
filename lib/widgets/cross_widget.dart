import 'package:flutter/material.dart';
import 'package:nlcsn/constants/ui_constants.dart';

class CrossWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  const CrossWidget({
    Key? key,
    this.color = crossWidgetColor,
    this.strokeWidth = widgetStrokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CrossPainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _CrossPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0.0, 0.0),
      Offset(size.width, size.height),
      painter,
    );

    canvas.drawLine(
      Offset(0.0, size.height),
      Offset(size.width, 0.0),
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

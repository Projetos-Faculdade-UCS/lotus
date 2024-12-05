import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  const DottedBorder({
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashLength = 4.0,
    super.key,
  });
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double dashLength;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
      ),
      child: child,
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  _DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
  });
  final Color color;
  final double strokeWidth;
  final double dashLength;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var startX = 0.0;
    final path = Path();

    // Top border
    while (startX < size.width) {
      path.moveTo(startX, 0);
      path.lineTo(startX + dashLength, 0);
      startX += 2 * dashLength;
    }

    startX = 0.0;

    // Bottom border
    while (startX < size.width) {
      path.moveTo(startX, size.height);
      path.lineTo(startX + dashLength, size.height);
      startX += 2 * dashLength;
    }

    var startY = 0.0;

    // Left border
    while (startY < size.height) {
      path.moveTo(0, startY);
      path.lineTo(0, startY + dashLength);
      startY += 2 * dashLength;
    }

    startY = 0.0;

    // Right border
    while (startY < size.height) {
      path.moveTo(size.width, startY);
      path.lineTo(size.width, startY + dashLength);
      startY += 2 * dashLength;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

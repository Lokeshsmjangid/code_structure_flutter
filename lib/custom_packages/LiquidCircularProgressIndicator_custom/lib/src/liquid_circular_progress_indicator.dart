import 'dart:math' as math;

import 'package:evolve/custom_packages/LiquidCircularProgressIndicator_custom/lib/src/wave.dart';
import 'package:flutter/material.dart';

const double _twoPi = math.pi * 2.0;
const double _epsilon = .001;
const double _sweep = _twoPi - _epsilon;

class LiquidCircularProgressIndicator extends ProgressIndicator {
  ///The width of the border, if this is set [borderColor] must also be set.
  final double? borderWidth;

  ///The color of the border, if this is set [borderWidth] must also be set.
  final Color? borderColor;

  ///The widget to show in the center of the progress indicator.
  final Widget? center;

  ///The direction the liquid travels.
  final Axis direction;

  LiquidCircularProgressIndicator({
    Key? key,
    double value = 0.5,
    Color? backgroundColor,
    Animation<Color>? valueColor,
    this.borderWidth,
    this.borderColor,
    this.center,
    this.direction = Axis.vertical,
  }) : super(
    key: key,
    value: value,
    backgroundColor: backgroundColor,
    valueColor: valueColor,
  ) {
    if (borderWidth != null && borderColor == null ||
        borderColor != null && borderWidth == null) {
      throw ArgumentError("borderWidth and borderColor should both be set.");
    }
  }

  Color _getBackgroundColor(BuildContext context) =>
      backgroundColor ?? Theme.of(context).colorScheme.background;

  Color _getValueColor(BuildContext context) =>
      valueColor?.value ?? Theme.of(context).colorScheme.secondary;

  @override
  State<StatefulWidget> createState() =>
      _LiquidCircularProgressIndicatorState();
}

class _LiquidCircularProgressIndicatorState
    extends State<LiquidCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CircleClipper(),
      child: CustomPaint(
        painter: _CirclePainter(
          color: widget._getBackgroundColor(context),
        ),
        foregroundPainter: _CircleBorderPainter(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        child: Stack(
          children: [
            Wave(
              value: widget.value,
              color: widget._getValueColor(context),
              direction: widget.direction,
            ),
            if (widget.center != null) Center(child: widget.center),
          ],
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;

  _CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = math.min(centerX, centerY);

    Path path = Path();
    path.moveTo(centerX, centerY - radius);
    path.cubicTo(
        centerX + radius * 0.193,
        centerY - radius,
        centerX + radius,
        centerY - radius * 0.193,
        centerX + radius,
        centerY);
    path.cubicTo(
        centerX + radius,
        centerY + radius * 0.193,
        centerX + radius * 0.193,
        centerY + radius,
        centerX,
        centerY + radius);
    path.cubicTo(
        centerX - radius * 0.193,
        centerY + radius,
        centerX - radius,
        centerY + radius * 0.193,
        centerX - radius,
        centerY);
    path.cubicTo(
        centerX - radius,
        centerY - radius * 0.193,
        centerX - radius * 0.193,
        centerY - radius,
        centerX,
        centerY - radius);
    path.close();

    Paint paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => color != oldDelegate.color;
}


class _CircleBorderPainter extends CustomPainter {
  final Color? color;
  final double? width;

  _CircleBorderPainter({this.color, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    if (color == null || width == null) {
      return;
    }

    final borderPaint = Paint()
      ..color = color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    final newSize = Size(size.width - width!, size.height - width!);
    canvas.drawArc(Offset(width! / 2, width! / 2) & newSize, 0, _sweep, false,
        borderPaint);
  }

  @override
  bool shouldRepaint(_CircleBorderPainter oldDelegate) =>
      color != oldDelegate.color || width != oldDelegate.width;
}

class _CircleClipper extends CustomClipper<Path> { // ander wala
  @override
  Path getClip(Size size) {
    final path1 = Path()..addArc(Offset.zero & size, 0, _sweep);
    final path = Path()
      ..moveTo(50, 95)
      ..cubicTo(69.3, 95, 85, 79.3, 85, 60)
      ..cubicTo(85, 39, 63.4, 17.3, 51.8, 5.7)
      ..cubicTo(50.8, 4.7, 49.2, 4.7, 48.3, 5.7)
      ..cubicTo(36.6, 17.3, 15, 39, 15, 60)
      ..cubicTo(15, 79.3, 30.7, 95, 50, 95)
      ..close()
      ..moveTo(50, 11)
    // ..cubicTo(61.4, 22.4, 80, 42, 80, 60)
    // ..cubicTo(80, 76.5, 66.5, 90, 50, 90)
    // ..cubicTo(33.5, 90, 20, 76.5, 20, 60)
    // ..cubicTo(20, 42, 38.6, 22.5, 50, 11)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stars_wars_app/features/widgets/sides.dart';

class Cube extends StatelessWidget {
  const Cube({
    Key? key,
    required this.x,
    required this.y,
    required this.color,
    required this.size,
    required this.child,
    this.rainbow = false,
  }) : super(key: key);

  static const double _shadow = 0.2, _halfPi = pi / 2, _oneHalfPi = pi + pi / 2;
  final Widget child;
  final double x, y, size;
  final Color color;
  final bool rainbow;

  double get _sum => (y + (x > pi ? pi : 0.0)).abs() % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final bool _topBottom = x < _halfPi || x > _oneHalfPi;
    final bool _northSouth = _sum < _halfPi || _sum > _oneHalfPi;
    final bool _eastWest = _sum < pi;

    return Stack(
      children: [
        Side(
          zRot: y,
          xRot: -x,
          shadow: _getShadow(x),
          moveZ: _topBottom,
          color: color,
          size: size,
          child: child,
        ),
        Side(
          yRot: y,
          xRot: _halfPi - x,
          shadow: _getShadow(_sum),
          moveZ: _northSouth,
          color: color,
          size: size,
          child: child,
        ),
        Side(
          yRot: -_halfPi + y,
          xRot: _halfPi - x,
          shadow: _shadow - _getShadow(_sum),
          moveZ: _eastWest,
          color: color,
          size: size,
          child: child,
        ),
      ],
    );
  }

  double _getShadow(double r) {
    if (r < _halfPi) {
      return map(r, 0, _halfPi, 0, _shadow);
    } else if (r > _oneHalfPi) {
      return _shadow - map(r, _oneHalfPi, pi * 2, 0, _shadow);
    } else if (r < pi) {
      return _shadow - map(r, _halfPi, pi, 0, _shadow);
    }

    return map(r, pi, _oneHalfPi, 0, _shadow);
  }

  double map(num value,
        [num iStart = 0, num iEnd = pi * 2, num oStart = 0, num oEnd = 1.0]) =>
    ((oEnd - oStart) / (iEnd - iStart)) * (value - iStart) + oStart;

}


import 'package:flutter/material.dart';

class Side extends StatelessWidget {
  const Side({
    Key? key,
    this.moveZ = true,
    this.xRot = 0.0,
    this.yRot = 0.0,
    this.zRot = 0.0,
    this.shadow = 0.0,
    this.size = 0.0,
    required this.child,
    required this.color,
  }) : super(key: key);
  final bool moveZ;
  final double xRot;
  final double yRot;
  final double zRot;
  final double shadow;
  final double size;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(xRot)
        ..rotateY(yRot)
        ..rotateZ(zRot)
        ..translate(0.0, 0.0, moveZ ? -size / 2 : size / 2),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.expand(width: size, height: size),
          color: color,
          child: child,
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(shadow),
            border: Border.all(width: 0.8, color: Colors.black26),
          ),
        ),
      ),
    );
  }
}


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stars_wars_app/core/utils/native/gyroscope.dart';
import 'package:stars_wars_app/features/widgets/cube.dart';

class CubeFrame extends StatefulWidget {
  const CubeFrame({Key? key}) : super(key: key);

  @override
  State<CubeFrame> createState() => _CubeFrameState();
}

class _CubeFrameState extends State<CubeFrame> {
  final List<Widget> _list = <Widget>[];
  final GyroscopeEvents streamGyroscope = GyroscopeEvents();

  final double _size = 50.0;

  int get size => _list.length;

  @override
  Widget build(BuildContext context) {
    var _x = pi * 0.25, _y = pi * 0.25;

    return StreamBuilder(
      stream: streamGyroscope.gyroscope,
      initialData: Gyroscope(x: 120, y: 118, z: 40),
      builder: (BuildContext context, AsyncSnapshot<Gyroscope> snapshot) {
        _x = (_x + -(snapshot.data!.y) / 150) % (pi * 2);
        _y = (_y + -(snapshot.data!.x) / 150) % (pi * 2);
        return Stack(
          children: [
            Cube(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(),
              ),
              color: Colors.red.shade200,
              x: _x,
              y: _y,
              size: _size,
            )
          ],
        );
      },
    );
  }
}
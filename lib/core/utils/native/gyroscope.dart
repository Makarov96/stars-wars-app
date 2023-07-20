import 'package:flutter/services.dart';

const EventChannel _gyroscopeEventChannel =
    EventChannel('stw_sensors/gyroscope');

class Gyroscope {
  Gyroscope({
    required this.x,
    required this.y,
    required this.z,
  });
  Gyroscope.fromList(List<double> list)
      : x = list[0],
        y = list[1],
        z = list[2];

  final double x;
  final double y;
  final double z;

  @override
  String toString() => '[Gyroscope(x: $x, y: $y, z: $z)]';
}

class GyroscopeEvents {
  late Stream<Gyroscope> _gyroscopeEvents;

  Stream<Gyroscope> get gyroscope {
    _gyroscopeEvents = _gyroscopeEventChannel.receiveBroadcastStream().map(
          (dynamic event) => Gyroscope.fromList(
            event.cast<double>(),
          ),
        );
    return _gyroscopeEvents;
  }
}

import 'package:flutter/material.dart';

class MDScrollPhysics extends ScrollPhysics {
  const MDScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  MDScrollPhysics applyTo(ScrollPhysics ancestor) {
    return MDScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * 0.3;
  }

  // @override
  // Simulation createBallisticSimulation(
  //     ScrollMetrics position, double velocity) {
  //   final tolerance = this.tolerance;
  //   if ((velocity.abs() < tolerance.velocity) ||
  //       (velocity > 0.0 && position.pixels >= position.maxScrollExtent) ||
  //       (velocity < 0.0 && position.pixels <= position.minScrollExtent)) {
  //     return null;
  //   }
  //   print(position.pixels);

  //   return ClampingScrollSimulation(
  //     position: position.pixels,
  //     velocity: velocity,
  //     friction: 0.5, // <--- HERE
  //     tolerance: tolerance,
  //   );
  // }
}

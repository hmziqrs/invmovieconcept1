import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ReservationProvider extends ChangeNotifier {
  static ReservationProvider state(BuildContext context, [listen = false]) =>
      Provider.of<ReservationProvider>(context, listen: listen);
}

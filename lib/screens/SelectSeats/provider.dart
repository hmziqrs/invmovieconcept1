import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/models/MovieTicket.dart';

class SelectSeatsProvider extends ChangeNotifier {
  static SelectSeatsProvider state(BuildContext context, [listen = false]) =>
      Provider.of<SelectSeatsProvider>(context, listen: listen);

  static bool init = false;
  static List<DateTime> times = [];
  static List<DateTime> dates = [];
  static List<Tuple2<int, int>> reserved = [];
  static List<List<Tuple2<int, int>>> seats = [];

  DateTime? selectedDay;
  DateTime? selectedTime;
  bool fadeOff = false;
  List<Tuple2<int, int>> selectedSeats = [];

  final controller = ScrollController();

  SelectSeatsProvider([MovieTicket? reservation]) {
    final currentTime = DateTime.now();

    if (reservation != null) {
      final rTime = reservation.time;
      this.selectedDay = DateTime(
        rTime.year,
        rTime.month,
        rTime.day,
      );
      this.selectedTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        rTime.hour,
      );
      this.selectedSeats = reservation.seats;
    }

    if (init) {
      return;
    }
    init = true;

    times = List.generate(
      5,
      (index) => DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        9 + (index * 3),
      ),
    );

    dates = List.generate(
      7,
      (index) => DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day + index,
      ),
    );

    final r = Random();
    for (int y = 0; y < 6; y++) {
      final limit = y == 0 ? 5 : 9;
      final centerIndex = (limit / 2).floor();
      final List<Tuple2<int, int>> yList = [];

      for (int x = 0; x < limit; x++) {
        final seat = Tuple2(y, x);
        yList.add(seat);
        if (r.nextInt(7) == 5 && x != centerIndex) {
          reserved.add(seat);
        }
      }
      seats.add(yList);
    }
  }

  selectDay(DateTime day) {
    if (day == this.selectedDay) {
      this.selectedDay = null;
    } else {
      this.selectedDay = day;
    }
    notifyListeners();
  }

  selectTime(DateTime time) {
    if (time == this.selectedTime) {
      this.selectedTime = null;
    } else {
      this.selectedTime = time;
    }
    notifyListeners();
  }

  void setFade(bool flag) {
    this.fadeOff = flag;
    notifyListeners();
  }

  void toggleSeat(Tuple2<int, int> seat) {
    final newList = [...this.selectedSeats];
    final contains = this.selectedSeats.contains(seat);
    if (contains) {
      newList.remove(seat);
    } else {
      newList.add(seat);
    }
    if (this.selectedSeats.isEmpty && newList.isNotEmpty) {
      this.doScroll();
    }
    this.selectedSeats = newList;
    notifyListeners();
  }

  Future<void> doScroll() async {
    await 200.milliseconds.delay;
    this.controller.animateTo(
          this.controller.position.maxScrollExtent,
          curve: Curves.ease,
          duration: 200.milliseconds,
        );
  }
}

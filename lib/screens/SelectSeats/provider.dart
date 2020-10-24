import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class SelectSeatsProvider extends ChangeNotifier {
  static SelectSeatsProvider state(BuildContext context, [listen = false]) =>
      Provider.of<SelectSeatsProvider>(context, listen: listen);

  int selectedDay;
  int selectedTime;
  bool fadeOff = false;
  List<Tuple2<int, int>> seats = [];
  List<Tuple2<int, int>> reserved = [];
  final controller = ScrollController();

  SelectSeatsProvider() {
    final r = Random();

    for (int y = 0; y < 6; y++) {
      final limit = y == 0 ? 5 : 9;
      final centerIndex = (limit / 2).floor();

      for (int x = 0; x < limit; x++) {
        if (r.nextInt(7) == 5 && x != centerIndex) {
          this.reserved.add(Tuple2(y, x));
        }
      }
    }
  }

  selectDay(int day) {
    if (day == this.selectedDay) {
      this.selectedDay = null;
    } else {
      this.selectedDay = day;
    }
    notifyListeners();
  }

  selectTime(int time) {
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
    final newList = [...seats];
    final contains = this.seats.contains(seat);
    if (contains) {
      newList.remove(seat);
    } else {
      newList.add(seat);
    }
    if (this.seats.isEmpty && newList.isNotEmpty) {
      this.doScroll();
    }
    this.seats = newList;
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

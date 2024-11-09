import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

import 'MovieObject.dart';

class MovieTicket {
  final MovieObject movie;
  final DateTime time;
  final List<Tuple2<int, int>> seats;

  MovieTicket({
    required this.movie,
    required this.time,
    required this.seats,
  });

  MovieTicket copyWith({
    MovieObject? movie,
    DateTime? time,
    List<Tuple2<int, int>>? seats,
  }) {
    return MovieTicket(
      movie: movie ?? this.movie,
      time: time ?? this.time,
      seats: seats ?? this.seats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movie': movie.toMap(),
      'time': time.millisecondsSinceEpoch,
      'seats': seats.map((x) => x.toList()).toList(),
    };
  }

  factory MovieTicket.fromMap(Map<String, dynamic> map) {
    return MovieTicket(
      movie: MovieObject.fromMap(map['movie']),
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      seats: List<Tuple2<int, int>>.from(
          map['seats']?.map((x) => Tuple2<int, int>.fromList(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieTicket.fromJson(String source) =>
      MovieTicket.fromMap(json.decode(source));

  @override
  String toString() => 'MovieTicket(movie: $movie, time: $time, seats: $seats)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieTicket &&
        o.movie == movie &&
        o.time == time &&
        listEquals(o.seats, seats);
  }

  @override
  int get hashCode => movie.hashCode ^ time.hashCode ^ seats.hashCode;
}

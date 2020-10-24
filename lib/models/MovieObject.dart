import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieObject {
  final String name;
  final String desc;
  final String image;
  final double ratings;
  final List<String> tags;

  MovieObject({
    this.name,
    this.desc,
    this.image,
    this.ratings,
    this.tags,
  });

  MovieObject copyWith({
    String name,
    String desc,
    String image,
    double ratings,
    List<String> tags,
  }) {
    return MovieObject(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      ratings: ratings ?? this.ratings,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'image': image,
      'ratings': ratings,
      'tags': tags,
    };
  }

  factory MovieObject.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovieObject(
      name: map['name'],
      desc: map['desc'],
      image: map['image'],
      ratings: map['ratings'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieObject.fromJson(String source) =>
      MovieObject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieObject(name: $name, desc: $desc, image: $image, ratings: $ratings, tags: $tags)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieObject &&
        o.name == name &&
        o.desc == desc &&
        o.image == image &&
        o.ratings == ratings &&
        listEquals(o.tags, tags);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        desc.hashCode ^
        image.hashCode ^
        ratings.hashCode ^
        tags.hashCode;
  }
}

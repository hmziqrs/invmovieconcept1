import 'package:invmovieconcept1/models/MovieObject.dart';

final List<MovieObject> list = [
  MovieObject(
    ratings: 6.6,
    name: "Star Wars",
    image: "assets/movies/starwars.jpg",
    desc:
        "The surviving members of the resistance face the First Order once again, and the legendary conflict between the Jedi and the Sith reaches its peak bringing the Skywalker saga to its end.",
    tags: ["Action", "Adventure", "Fantasy"],
  ),
  MovieObject(
    ratings: 5.5,
    name: "Bloodshot",
    image: "assets/movies/bloodshot.jpg",
    desc: "Ray Garrison, a slain soldier, is re-animated with superpowers.",
    tags: ["Action", "Drama", "Sci-Fi"],
  ),
  MovieObject(
    ratings: 6.8,
    name: "Spies in Disguise",
    image: "assets/movies/spiesInDisguise.jpg",
    desc:
        "When the world's best spy is turned into a pigeon, he must rely on his nerdy tech officer to save the world.",
    tags: ["Animation", "Adventure", "Comedy"],
  ),
  MovieObject(
    ratings: 9.0,
    name: "The Dark Knight",
    image: "assets/movies/theDarkKnight.jpg",
    desc:
        "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    tags: ["Action", "Crime", "Drama"],
  ),
];
